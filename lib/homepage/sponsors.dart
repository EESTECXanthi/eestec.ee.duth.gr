import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sizer/sizer.dart';
import 'package:website/homepage/event.dart';
import 'package:website/widgets/lang_changer.dart';

class SponsorList extends StatelessWidget {
  const SponsorList({
    super.key,
    this.sponsors = const [],
    this.color = Colors.red,
    this.size = 1,
  });
  final List<CurrentEventSponsor> sponsors;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return sponsors.isNotEmpty
        ? Padding(
            padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 5.h),
            child: Wrap(
              spacing: 2.w,
              children: [
                for (int i = 0; i < sponsors.length; i++)
                  SizedBox(
                    width: 25.h,
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () async {
                            final link = sponsors[i].link;
                            if (link == null) {
                              return;
                            }
                            if (await canLaunchUrl(Uri.parse(link))) {
                              await launchUrl(Uri.parse(link));
                            } else {
                              throw "Could not launch $link";
                            }
                          },
                          child: ExtendedImage.asset(
                            "assets/events/${sponsors[i].image}",
                            //fit: BoxFit.cover,
                            enableMemoryCache: true,
                            cacheRawData: true,
                            loadStateChanged: (ExtendedImageState state) {
                              switch (state.extendedImageLoadState) {
                                case LoadState.loading:
                                  return const Center(
                                      child: CircularProgressIndicator());
                                case LoadState.completed:
                                  return ExtendedRawImage(
                                    image: state.extendedImageInfo?.image,
                                    height: size * 30.h,
                                  );
                                case LoadState.failed:
                                  return GestureDetector(
                                    child:
                                        const Center(child: Icon(Icons.error)),
                                    onTap: () {
                                      state.reLoadImage();
                                    },
                                  );
                              }
                            },
                          ),
                        ),
                        Text(sponsors[i].name ?? "",
                            style: TextStyle(color: color, fontSize: 2.w)),
                        sponsors[i].desc != null
                            ? GestureDetector(
                                onTap: () async {
                                  await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: LangText(
                                            greek: sponsors[i].desc?["greek"] ??
                                                "",
                                            english:
                                                sponsors[i].desc?["english"] ??
                                                    "",
                                          ),
                                        );
                                      });
                                },
                                child: const Icon(
                                  Icons.info,
                                  color: Colors.grey,
                                ))
                            : const SizedBox.shrink()
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     for (int j = 0; j < sponsors[i].stars; j++)
                        //       Icon(Icons.star, color: color),
                        //     sponsors[i].desc != null
                        //         ? GestureDetector(
                        //             onTap: () async {
                        //               await showDialog(
                        //                   context: context,
                        //                   builder: (context) {
                        //                     return AlertDialog(
                        //                       content: LangText(
                        //                         greek: sponsors[i]
                        //                                 .desc?["greek"] ??
                        //                             "",
                        //                         english: sponsors[i]
                        //                                 .desc?["english"] ??
                        //                             "",
                        //                       ),
                        //                     );
                        //                   });
                        //             },
                        //             child: const Icon(
                        //               Icons.info,
                        //               color: Colors.grey,
                        //             ))
                        //         : const SizedBox.shrink(),
                        //   ],
                        // )
                      ],
                    ),
                  )
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
