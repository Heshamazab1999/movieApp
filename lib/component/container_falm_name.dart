import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:movie/constant.dart';

class NameOfFilm extends StatelessWidget {
  final String name;
  final String rate;
  final String date;

  NameOfFilm({this.name, this.date, this.rate});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 120,
            height: 50,
            child: AutoSizeText(
              name,
              maxLines: 2,
              style: TextStyle(color: K.whiteColor, fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: 120,
              child: AutoSizeText(
                "\($date\)",
                maxLines: 1,
                style: TextStyle(color: K.whiteColor, fontSize: 25),
              ),
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: K.secondColor,
              ),
              AutoSizeText(
                rate,
                style: TextStyle(color: K.whiteColor, fontSize: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
