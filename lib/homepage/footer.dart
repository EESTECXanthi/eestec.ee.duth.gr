import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/responsive.dart';
import 'package:latlong2/latlong.dart';
import 'package:sizer/sizer.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(
      horizontal: 2.h,
      vertical: 2.w,
    );
    List<Widget> items = [
      Container(
        padding: padding,
        width: 20.h,
        child: Column(
          children: [
            const Text(
              "Contacts",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Divider(
              color: Colors.white,
              thickness: 5,
              indent: 10,
              endIndent: 10,
            ),
            Wrap(
              children: [
                IconButton(
                    onPressed: () async {
                      if (await canLaunchUrl(Uri.parse(
                          "https://www.instagram.com/eestec_lc_xanthi/"))) {
                        await launchUrl(Uri.parse(
                            "https://www.instagram.com/eestec_lc_xanthi/"));
                      } else {
                        throw "Could not launch instagram";
                      }
                    },
                    icon: Icon(
                      MdiIcons.instagram,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () async {
                      if (await canLaunchUrl(Uri.parse(
                          "https://www.facebook.com/eesteclcxanthi/"))) {
                        await launchUrl(Uri.parse(
                            "https://www.facebook.com/eesteclcxanthi/"));
                      } else {
                        throw "Could not launch facebook";
                      }
                    },
                    icon: Icon(
                      MdiIcons.facebook,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () async {
                      if (await canLaunchUrl(Uri.parse(
                          "https://www.linkedin.com/company/eesteclcxanthi/"))) {
                        await launchUrl(Uri.parse(
                            "https://www.linkedin.com/company/eesteclcxanthi/"));
                      } else {
                        throw "Could not launch linkedin";
                      }
                    },
                    icon: Icon(
                      MdiIcons.linkedin,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () async {
                      if (await canLaunchUrl(Uri.parse(
                          "https://www.youtube.com/channel/UC_8gbN7BrNbd_GSdkDH83jw"))) {
                        await launchUrl(Uri.parse(
                            "https://www.youtube.com/channel/UC_8gbN7BrNbd_GSdkDH83jw"));
                      } else {
                        throw "Could not launch youtube";
                      }
                    },
                    icon: Icon(
                      MdiIcons.youtube,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () async {
                      if (await canLaunchUrl(
                          Uri.parse("https://github.com/EESTECXanthi"))) {
                        await launchUrl(
                            Uri.parse("https://github.com/EESTECXanthi"));
                      } else {
                        throw "Could not launch github";
                      }
                    },
                    icon: Icon(
                      MdiIcons.github,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      MdiIcons.mail,
                      color: Colors.white,
                    )),
              ],
            ),
          ],
        ),
      ),
      Expanded(
        child: Padding(
          padding: padding,
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(41.13968287960835, 24.893633084659307),
              zoom: 15.0,
            ),
            children: [
              TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: const ["a", "b", "c"]),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(41.13968287960835, 24.893633084659307),
                    child: Image.asset(
                      "assets/misc/pin.png",
                      //height: 10.h,
                      //width: 10.h,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ];

    return Container(
      color: Colors.grey[700],
      height: 40.h,
      width: MediaQuery.of(context).size.width,
      child: Responsive(
        desktop: Row(children: items),
        mobile: Column(children: items),
      ),
    );
  }
}
