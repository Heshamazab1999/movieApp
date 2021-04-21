import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class FilmContainer extends StatelessWidget {
  final String image;
  final Function function;

  FilmContainer({this.image,this.function,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap:function ,
        child: Container(
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
    );
  }
}
