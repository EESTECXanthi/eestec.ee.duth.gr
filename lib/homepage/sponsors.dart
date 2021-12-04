import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/data/website_sponsors.dart';
import 'package:sizer/sizer.dart';
import 'package:website/homepage/current_event.dart';

class SponsorList extends StatelessWidget {
  const SponsorList({
    Key? key,
    this.sponsors = const [],
    this.color = Colors.red,
    this.size = 1,
  }) : super(key: key);
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
                  Container(
                    width: 25.h,
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () async {
                            final link = sponsors[i].link;
                            if (link == null) {
                              return;
                            }
                            if (await canLaunch(link)) {
                              await launch(link);
                            } else {
                              throw "Could not launch $link";
                            }
                          },
                          child: Image.asset(
                            "assets/sponsors/${sponsors[i].image}",
                            height: size * 30.h,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int j = 0; j < sponsors[i].stars; j++)
                              Icon(Icons.star, color: color),
                            sponsors[i].desc != null
                                ? IconButton(
                                    onPressed: () async {
                                      await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Text(sponsors[i].desc!),
                                            );
                                          });
                                    },
                                    icon: const Icon(
                                      Icons.info,
                                      color: Colors.grey,
                                    ))
                                : const SizedBox.shrink(),
                          ],
                        )
                      ],
                    ),
                  )
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}