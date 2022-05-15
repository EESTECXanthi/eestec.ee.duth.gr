import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:website/homepage/sponsors.dart';
import 'package:sizer/sizer.dart';

class EventList extends StatelessWidget {
  const EventList({Key? key}) : super(key: key);

  Future<List<EventModel>> getevents() async {
    final manifest = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> decoded = json.decode(manifest);
    List<String> rootkeys = decoded.keys.toList();

    List<EventModel> events = [];

    try {
      int index = 0;
      while (true) {
        final keys = rootkeys
            .where(
                (dynamic key) => key.startsWith('assets/events/${index}_event'))
            .toList();
        final String filename = Uri.decodeFull(keys[0]).split('/').last;
        final parts = filename.split('_').toList();
        final color = Color(int.parse("0x${parts[3].substring(0, 8)}"));
        var sponsorsKeys = rootkeys
            .where((dynamic key) =>
                key.startsWith('assets/events/${index}_sponsor'))
            .toList();
        sponsorsKeys =
            sponsorsKeys.map((String key) => key.split('/').last).toList();

        List<CurrentEventSponsor> sponsors = [];
        for (String k in sponsorsKeys) {
          // sponsor_3_fagi_fagi.gr_test description.png
          //    0    1   2    3              4
          // print("key encoded: $k");
          k = Uri.decodeFull(k);
          // print("key decoded: $k");
          final parts = k.split('_').toList();

          final stars = int.parse(parts[2]);
          Map<String, String>? desc;
          String link = "";

          if (parts.length == 6) {
            link = parts[4];
            desc = {
              "greek": parts[5].substring(0, parts[5].length - 4),
              "english": "todo",
            };
          }

          ///to cut the last 4 characters from the link
          /// it includes extentsions like (.png,.jpg)
          if (parts.length == 5) {
            link = parts[4].substring(0, parts[4].length - 4);
          }
          if (link != "") {
            link = "http://$link";
          }

          final s = CurrentEventSponsor(
            stars: stars,
            name: parts[3],
            link: link,
            desc: desc,
            image: k,
          );
          sponsors.add(s);
        }

        sponsors.sort((a, b) {
          if (a.stars > b.stars) {
            return -1;
          } else if (a.stars < b.stars) {
            return 1;
          }
          return 0;
        });

        final List<CurrentEventSponsor> primarySponsors =
            sponsors.where((CurrentEventSponsor s) => s.stars != 0).toList();
        final List<CurrentEventSponsor> secondarySponsors =
            sponsors.where((CurrentEventSponsor s) => s.stars == 0).toList();
        final event = EventModel(
          color: color,
          name: parts[2],
          image: filename,
          sponsors: primarySponsors,
          also: secondarySponsors,
        );
        events.add(event);
        index++;
      }
      // ignore: empty_catches
    } catch (e) {}

    return events;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EventModel>>(
        future: getevents(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const CircularProgressIndicator();
          }
          return Column(
            children: data
                .map((e) => EventContainer(event: e))
                .toList()
                .reversed
                .toList(),
          );
        });
  }
}

class EventContainer extends StatelessWidget {
  const EventContainer({
    required this.event,
    Key? key,
  }) : super(key: key);
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/events/" + event.image),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(
            "${event.name} Sponsors:",
            style: TextStyle(
              color: event.color,
              fontWeight: FontWeight.bold,
              fontSize: 4.w,
            ),
          ),
        ),
        SponsorList(
          sponsors: event.sponsors,
          color: event.color,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.h),
          child: event.also.isNotEmpty
              ? Text(
                  "WE ALSO THANK",
                  style: TextStyle(
                    color: event.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 3.w,
                  ),
                )
              : null,
        ),
        SponsorList(
          sponsors: event.also,
          color: event.color,
          size: 0.5,
        ),
      ],
    );
  }
}

class EventModel {
  final Color color;
  final String name;
  final String image;
  final List<CurrentEventSponsor> sponsors;
  final List<CurrentEventSponsor> also;

  const EventModel({
    required this.color,
    required this.name,
    required this.image,
    this.also = const [],
    this.sponsors = const [],
  });
}

class CurrentEventSponsor {
  final String? name;
  final int stars;
  final Map<String, String>? desc;
  final String image;
  final String? link;

  const CurrentEventSponsor({
    this.link,
    required this.image,
    this.name,
    this.stars = 0,
    this.desc,
  });
}
