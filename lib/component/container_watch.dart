import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/constant.dart';
import 'package:octo_image/octo_image.dart';
class ContainerWatch extends StatelessWidget {
  final String image;


  ContainerWatch({this.image,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 400,
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
        ),
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: K.secondColor, width: 3)),
          child: Center(
              child: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.play_arrow,
              color: K.whiteColor,
              size: 70,
            ),
          )),
        )
      ],
    );
  }
}
