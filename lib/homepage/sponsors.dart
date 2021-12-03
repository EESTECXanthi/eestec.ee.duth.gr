import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/data/website_sponsors.dart';
import 'package:sizer/sizer.dart';

class SponsorList extends StatelessWidget {
  const SponsorList({Key? key, this.color = Colors.red}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return websiteSponsors.isNotEmpty
        ? Padding(
            padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 5.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    "Soft Skills Academy 7 Sponsors:",
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 4.w,
                    ),
                  ),
                ),
                Wrap(
                  spacing: 2.w,
                  children: [
                    for (int i = 0; i < websiteSponsors.length; i++)
                      Container(
                        width: 25.h,
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () async {
                                if (await canLaunch(websiteSponsors[i].link)) {
                                  await launch(websiteSponsors[i].link);
                                } else {
                                  throw "Could not launch ${websiteSponsors[i].link}";
                                }
                              },
                              child: websiteSponsors[i].logo,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.star, color: color)),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.info,
                                      color: Colors.grey,
                                    )),
                              ],
                            )
                          ],
                        ),
                      )
                  ],
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
