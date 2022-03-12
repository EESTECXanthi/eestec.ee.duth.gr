import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website/article_page/quotes.dart';

import '../responsive.dart';

class QuoteContainer extends StatelessWidget {
  const QuoteContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var random = Random();
    final quote = quotes.elementAt(random.nextInt(quotes.length));
    return Center(
      child: SizedBox(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: Column(
              children: [
                Text(
                  quote.quote,
                  style: GoogleFonts.lato(
                      fontSize: Responsive.isMobile(context) ? 7.w : 3.w,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.w),
                  child: Text('-${quote.author}',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Responsive.isMobile(context) ? 5.w : 2.w)),
                ),
              ],
            )),
      ),
    );
  }
}
