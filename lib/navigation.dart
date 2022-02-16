import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/about_eestec/about_eestec.dart';
import 'package:website/about_us/about_us.dart';
import 'package:website/bloc/lang.dart';
import 'package:website/faq/faq.dart';
import 'package:website/homepage/homepage.dart';
import 'package:website/responsive.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events/event_page.dart';

class Navigation extends StatelessWidget {
  Navigation(
      {Key? key, required this.child, this.floatingActionButton, this.bottom})
      : super(key: key);
  final PreferredSizeWidget? bottom;
  final Widget child;
  final Widget? floatingActionButton;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  get items => null;

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [
      const _Action(
        text: "ABOUT US",
        push: AboutUs(),
      ),
      const _Action(
        text: "About EESTEC",
        push: AboutEestec(),
      ),
      const _Action(
        text: "OUR EVENTS",
        push: EventPage(),
      ),
      // _Action(
      //   text: "FAQ",
      //   push: Faq(),
      // ),
      const _Action(
        text: "CONTACT US",
        link:
            "https://docs.google.com/forms/d/e/1FAIpQLSdLQL0zVm8yfNDMrDtHbD-1d_aqnZazGDXb2RmFf1h2iBxkKw/viewform",
      ),
      BlocBuilder<Language, String>(builder: (context, lang) {
        return Center(
          child: DropdownButton<String>(
              hint: lang == "el"
                  ? Flag.fromCode(FlagsCode.US, height: 1.h, width: 1.w)
                  : Flag.fromCode(FlagsCode.GR, height: 1.h, width: 1.w),
              items: [
                DropdownMenuItem(
                  child: Flag.fromCode(FlagsCode.BR, height: 1.h, width: 1.w),
                  value: "en",
                ),
                DropdownMenuItem(
                  child: Flag.fromCode(FlagsCode.GR, height: 1.h, width: 1.w),
                  value: "el",
                ),
              ],
              onChanged: (val) {
                if (val != null) context.read<Language>().changeLang(val);
              }),
        );
      }),
    ];

    return Scaffold(
      key: _scaffoldKey,
      drawer: Responsive.isMobile(context)
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Image.asset("assets/misc/logo.png"),
                    ),
                  ),
                  ...actions
                ],
              ),
            )
          : null,
      appBar:
          // appBar(
          //   context,
          //   actions: Responsive.isMobile(context)
          //       ? [
          //           IconButton(
          //               onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          //               icon: const Icon(Icons.menu))
          //         ]
          //       : actions,
          // ),

          AppBar(
        bottom: bottom,
        automaticallyImplyLeading: false,
        toolbarHeight: 16.h,
        title: SafeArea(
          child: GestureDetector(
            onTap: () => _Action.pushEvent(context, HomePage()),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: Image.asset(
                "assets/misc/logo.png",
                filterQuality: FilterQuality.none,
                //width: 16.w,
                height: 12.h,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        actions: Responsive.isMobile(context)
            ? [
                IconButton(
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                    icon: const Icon(Icons.menu))
              ]
            : actions,
      ),
      floatingActionButton: floatingActionButton,
      body: child,
    );
  }
}

class _Action extends StatelessWidget {
  const _Action({Key? key, required this.text, this.push, this.link})
      : assert(push != null || link != null),
        super(key: key);
  final String text;
  final Widget? push;
  final String? link;
  static void pushEvent(BuildContext context, Widget push) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) => push,
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _link = link;
    final _push = push;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextButton(
          onPressed: () async {
            if (_push != null) {
              pushEvent(context, _push);
            } else if (_link != null) {
              if (await canLaunch(_link)) {
                await launch(_link);
              } else {
                throw "Could not launch $_link";
              }
            }
          },
          child: Text(
            text,
            style: TextStyle(
                color:
                    Responsive.isMobile(context) ? Colors.red : Colors.white),
          )),
    );
  }
}

PreferredSize appBar(BuildContext context, {required List<Widget> actions}) {
  return PreferredSize(
      child: SafeArea(
        child: Container(
          color: Colors.red,
          child: Row(
            children: [
              GestureDetector(
                onTap: () => _Action.pushEvent(context, const HomePage()),
                child: SvgPicture.asset("assets/misc/logo.svg",
                    semanticsLabel: 'EESTEC LOGO'),
                // Image.asset(
                //   "assets/misc/logo.png",
                //   filterQuality: FilterQuality.high,
                //   width: 16.w,
                //   fit: BoxFit.contain,
                // ),
              ),
              Expanded(
                child: Container(),
              ),
              ...actions,
            ],
          ),
        ),
      ),
      preferredSize: Size.fromHeight(10.h));
}
