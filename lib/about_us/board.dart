import 'package:flutter/material.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/misc/meetTheBoard.png"),
        Card(
          child: Column(children: [
            Align(
              alignment: Alignment.centerRight,
              child: DropdownButton<int>(
                items: [],
                onChanged: null,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
