import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class ContainerWatch extends StatelessWidget {
  final String image;

  ContainerWatch({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: OctoImage(
        alignment: Alignment.center,
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
    );
  }
}
