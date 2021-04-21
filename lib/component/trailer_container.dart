import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerContainer extends StatelessWidget {
  final String id;

  TrailerContainer({this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: YoutubePlayer(
        controller: YoutubePlayerController(
            flags: YoutubePlayerFlags(
              forceHD: true,
              autoPlay: false,
            ),
            initialVideoId: YoutubePlayer.convertUrlToId(id)),
        width: double.infinity,
      ),
    );
  }
}
