import 'package:flutter/material.dart';
import 'package:movie/constant.dart';

class Buttons extends StatelessWidget {
  final Function function;
  Buttons({this.function});
  @override
  Widget build(BuildContext context) {
    return             Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: function,
            child: Container(
              width: 140,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0557d3),
                    Color(0xFF0b66c6),
                    Color(0xFF0a6ec7),
                    Color(0xFF1187b9)
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: K.whiteColor,
                  ),
                  Text(
                    "Playing",
                    style: TextStyle(color: K.whiteColor),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 140,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0557d3),
                    Color(0xFF0b66c6),
                    Color(0xFF0a6ec7),
                    Color(0xFF1187b9)
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_circle_down,
                    color: K.whiteColor,
                  ),
                  Text(
                    "Download",
                    style: TextStyle(color: K.whiteColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}
