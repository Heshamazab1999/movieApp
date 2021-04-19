import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/constant.dart';
import 'package:octo_image/octo_image.dart';

class ActorsCard extends StatelessWidget {
  final String image;
  final String name;
  ActorsCard({this.name,this.image});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: K.whiteColor, shape: BoxShape.circle),
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
            SizedBox(
              width: 80,
              child: AutoSizeText(
                name,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(color: K.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
