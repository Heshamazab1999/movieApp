import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/constant.dart';
import 'package:octo_image/octo_image.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FilmContainer extends StatelessWidget {
  final String image;
  final String popularity;
  final Function function;

  FilmContainer({this.image,this.function, this.popularity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          GestureDetector(
        onTap:function ,
            child: Container(
              width: 300,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: OctoImage(
                width: double.infinity,
                height: double.infinity,
                image: CachedNetworkImageProvider(
                  image,
                ),
                placeholderBuilder: OctoPlaceholder.blurHash(
                    'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                    fit: BoxFit.fill),
                errorBuilder: (context, url, error) {
                  return Image.asset(
                    "assets/images/rango.jpg",
                    fit: BoxFit.fill,
                  );
                },
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: CircularPercentIndicator(
              radius: 50,
              animation: true,
              animationDuration: 1200,
              lineWidth: 3,
              percent: 0.4,
              center: new AutoSizeText(
                "$popularity",
                maxLines: 1,
                style: new TextStyle(color: K.whiteColor, fontSize: 15.0),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor:K.secondColor,
              progressColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
