import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/component/actors_card.dart';
import 'package:movie/component/loading.dart';
import 'package:movie/component/name_of_film.dart';
import 'package:movie/component/trailer_container.dart';
import 'package:movie/constant.dart';
import 'package:movie/controller/film_controller.dart';
import 'package:movie/controller/screen_watch_controller.dart';
import 'package:movie/enum/viewstate.dart';
import 'package:movie/model/series_model.dart';
import 'package:video_player/video_player.dart';

class WatchSeriesScreen extends StatelessWidget {
  final _controller = Get.put(ScreenWatchController());
  final SeriesModel seriesModel;

  WatchSeriesScreen({
    this.seriesModel,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: K.mainColor,
      body: Obx(
        () => (_controller.state == ViewState.busy)
            ? LoadingWidget()
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 250,
                        child: Obx(() => (_controller.state == ViewState.busy)
                            ? LoadingWidget()
                            : TrailerContainer(
                            id: "https://www.youtube.com/watch?v=" +
                                FilmController.to.videoSeries[0].key)),),
                    ContainerOfFilm(
                      name: seriesModel.name,
                      date: seriesModel.firstAirDate,
                      rate: seriesModel.voteAverage.toString(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Text(
                        "About",
                        style: TextStyle(color: K.whiteColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: AutoSizeText(
                        seriesModel.overview,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: K.whiteColor, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      child: Text(
                        "Watch trailer",
                        style: TextStyle(color: K.whiteColor, fontSize: 20),
                      ),
                    ),
                    Obx(() => (_controller.state == ViewState.busy)
                        ? LoadingWidget()
                        : TrailerContainer(
                            id: "https://www.youtube.com/watch?v=" +
                                FilmController.to.videoSeries[0].key)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Cast",
                        style: TextStyle(color: K.whiteColor, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                          itemCount: _controller.person.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) =>
                              ActorsCard(
                                image: "https://image.tmdb.org/t/p/w300/" +
                                    _controller.person[index].profileImg,
                                name: _controller.person[index].name,
                              )),
                    ),
                  ],
                ),
              ),
      ),
    ));
  }
}
