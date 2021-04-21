import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/constant.dart';
import 'package:octo_image/octo_image.dart';

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
                height: 180,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: K.textColor, borderRadius: BorderRadius.circular(5)),
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
                  child: AutoSizeText(
                    name,
                    maxLines: 2,
                    style: TextStyle(
                      color: K.whiteColor,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.star,
                    color: K.secondColor,
                    size: 25,
                  ),
                  AutoSizeText(
                    rate,
                    style: TextStyle(fontSize: 15, color: K.whiteColor),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
