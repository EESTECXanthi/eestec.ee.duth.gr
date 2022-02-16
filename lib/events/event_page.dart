import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:website/events/event_catergory.dart';
import 'package:sizer/sizer.dart';
import 'package:website/events/event_container.dart';

import 'package:website/navigation.dart';
import 'package:website/responsive.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigation(
        child: Responsive(
      mobile: ListView.builder(
        itemBuilder: events,
        itemCount: categories.length,
      ),
      desktop: TimelineTheme(
          data: TimelineThemeData(
            nodePosition: 0.05,
          ),
          child: Timeline.tileBuilder(
              builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.after,
            itemCount: categories.length,
            contentsBuilder: events,
            indicatorBuilder: (_, index) {
              return DotIndicator(
                size: 7.w,
                color: categories[index].color,
                child: ExtendedImage.asset(
                    "assets/misc/${categories[index].image}",
                    filterQuality: FilterQuality.high),
              );
            },
            connectorBuilder: (_, index, type) => DecoratedLineConnector(
              thickness: 13,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    type == ConnectorType.end
                        ? categories[index].color
                        : categories[index + 1].color,
                    categories[index + 1].color
                  ],
                ),
              ),
            ),
          ))),
    ));
  }
}

Widget events(BuildContext context, int index) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
    child: EventContainer(
      category: categories[index],
    ),
  );
}
