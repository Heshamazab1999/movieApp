import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/constant.dart';
import 'package:octo_image/octo_image.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FilmCard extends StatelessWidget {
  final String name;
  final String rate;
  final String image;
  final Function function;

  FilmCard({this.name, this.rate, this.function, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: function,
        child: Material(
          borderRadius: BorderRadius.circular(5),
          elevation: 1,
          shadowColor: K.secondColor,
          child: Container(
            width: 165,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: K.mainColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: K.textColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: OctoImage(
                    width: double.infinity,
                    height: double.infinity,
                    image: CachedNetworkImageProvider(
                      image,
                    ),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                        'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                        fit: BoxFit.contain),
                    errorBuilder: (context, url, error) {
                      return Image.asset(
                        "assets/images/rango.jpg",
                        fit: BoxFit.cover,
                      );
                    },
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 160,
                    height: 35,
                    child: AutoSizeText(
                      name,
                      maxLines: 2,
                      style: TextStyle(
                        color: K.whiteColor,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5, bottom: 5),
                  child: CircularPercentIndicator(
                    animateFromLastPercent: true,

                    radius: 35,
                    animation: true,
                    animationDuration: 1200,
                    lineWidth: 3,
                    percent: 0.4,
                    center: new AutoSizeText(
                      "$rate\%",
                      maxLines: 1,
                      style: new TextStyle(color: K.whiteColor, fontSize: 12),
                    ),
                    circularStrokeCap: CircularStrokeCap.butt,
                    backgroundColor: K.secondColor,
                    progressColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
