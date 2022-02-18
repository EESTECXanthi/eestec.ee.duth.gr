import 'package:dotted_line/dotted_line.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:timelines/timelines.dart';
import 'package:website/responsive.dart';
import 'package:website/widgets/lang_changer.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteContainer extends StatelessWidget {
  const QuoteContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 20.h,
        child: Card(
          // margin: EdgeInsets.symmetric(vertical: 3.h),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: Column(
              children: [
                Text(
                  'quote',
                  style: GoogleFonts.lato(
                      fontSize: 4.w,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text('-author',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 1.w)),
                ),
              ],
            ),
          ),
          elevation: 10,
          // decoration: BoxDecoration(
          //     color: Colors.red,
          //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
        ),
      ),
    );
  }
}
