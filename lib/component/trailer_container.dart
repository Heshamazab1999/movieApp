import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerContainer extends StatelessWidget {
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
              autoPlay: false,
            ),
            initialVideoId: YoutubePlayer.convertUrlToId(
                "https://www.youtube.com/watch?v=KyMO-_Ia-eg&list=RDKyMO-_Ia-eg&start_radio=1")),
        width: double.infinity,
      ),
    );
  }
}
