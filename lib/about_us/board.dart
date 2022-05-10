import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:website/about_us/board_model.dart';

import '../responsive.dart';
import '../widgets/lang_changer.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  late int year;

  @override
  void initState() {
    year = DateTime.now().year;
    super.initState();
  }

  Future<Map<int, List<BoardMember>>> loadBoards() async {
    final manifest = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> decoded = json.decode(manifest);
    List<String> keys = decoded.keys.toList();
    keys = keys.map((k) => Uri.decodeFull(k)).toList();

    final boardManifest =
        keys.where((dynamic key) => key.startsWith('assets/board')).toList();

    Map<int, List<BoardMember>> boardsMap = {};
    for (String memberManifest in boardManifest) {
      final member = memberManifest.split("/")[2];
      final year = num.parse(member.split("_")[0]).toInt();
      boardsMap.putIfAbsent(year, () => []);

      final x = BoardMember(
        position: member.split("_")[1],
        nameEnglish: member.split("_")[2],
        nameGreek: member.split("_")[3].split(".")[0],
        image: member,
      );

      boardsMap[year]!.add(x);
    }
    return boardsMap;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<int, List<BoardMember>>>(
        future: loadBoards(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final boards = snapshot.data!;
            return Column(
              children: [
                Image.asset("assets/misc/meetTheBoard.png"),
                Card(
                  child: Column(children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 1.h),
                        child: DropdownButton<int>(
                          hint: Text(year.toString()),
                          value: year,
                          items: List<DropdownMenuItem<int>>.generate(
                              boards.keys.length,
                              (index) => DropdownMenuItem<int>(
                                    child: Text(boards.keys
                                        .elementAt(index)
                                        .toString()),
                                    value: boards.keys.elementAt(index),
                                  )),
                          onChanged: (int? _year) {
                            if (_year != null) {
                              setState(() {
                                year = _year;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            flex: 1,
                            child: _BoardMember(boardMember: boards[year]![0])),
                        Expanded(
                            flex: 1,
                            child: _BoardMember(boardMember: boards[year]![1])),
                        Expanded(
                            flex: 1,
                            child: _BoardMember(boardMember: boards[year]![2])),
                        Expanded(
                            flex: 1,
                            child: _BoardMember(boardMember: boards[year]![3])),
                        Expanded(
                            flex: 1,
                            child: _BoardMember(boardMember: boards[year]![4])),
                      ],
                    )
                  ]),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

class _BoardMember extends StatelessWidget {
  const _BoardMember({
    Key? key,
    required this.boardMember,
  }) : super(key: key);

  final BoardMember boardMember;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LangText(
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Responsive.isMobile(context) ? 2.w : 2.w,
          ),
          greek: boardMember.positionGreek,
          english: boardMember.positionEnglish,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 3.h),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/board/${boardMember.image}"),
          ),
        ),
        LangText(
          greek: boardMember.nameGreek,
          english: boardMember.nameEnglish,
        ),
      ],
    );
  }
}
