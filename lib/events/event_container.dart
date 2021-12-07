import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:website/events/event_catergory.dart';
import 'package:website/responsive.dart';
import 'package:sizer/sizer.dart';

class EventContainer extends StatelessWidget {
  const EventContainer({Key? key, required this.category}) : super(key: key);
  final EventCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: Responsive.isMobile(context) ? 60.h : 20.h,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        color: category.color,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 3.h),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.5.w, 0.5.h), //(x,y)
                  blurRadius: 0.0,
                ),
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(
                color: Colors.grey,
              )),
          child: Column(
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  category.name,
                  style: TextStyle(
                    color: category.color,
                    fontWeight: FontWeight.bold,
                    fontSize: Responsive.isMobile(context) ? 7.w : 3.w,
                  ),
                ),
              )),
              DottedLine(
                dashColor: category.color,
                lineThickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  category.desc,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Responsive.isMobile(context) ? 5.w : 1.5.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
