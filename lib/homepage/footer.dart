import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
                    onPressed: () {},
                    icon: const Icon(
                      MdiIcons.instagram,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      MdiIcons.facebook,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      MdiIcons.linkedin,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
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
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ["a", "b", "c"]),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(41.13968287960835, 24.893633084659307),
                    builder: (ctx) => Image.asset(
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
