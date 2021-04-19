import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/component/container_film.dart';
import 'package:movie/component/film_card.dart';
import 'package:movie/component/loading.dart';
import 'package:movie/constant.dart';
import 'package:movie/controller/film_controller.dart';
import 'package:movie/enum/viewstate.dart';
import 'package:movie/screens/screen_watch.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class HomeScreen extends StatelessWidget {
  final _controller = Get.put(FilmController());

  @override
  Widget build(
    BuildContext context,
  ) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: K.mainColor,
          body: Obx(
            () => (_controller.state == ViewState.busy)
                ?LoadingWidget(
                )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          child: SizedBox(
                            height: 45,
                            child: TextField(
                                cursorColor: K.textColor,
                                decoration: K.textField),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Premier",
                                style:
                                    TextStyle(color: K.textColor, fontSize: 18),
                              ),
                              Text(
                                "All",
                                style: TextStyle(
                                    color: K.secondColor, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 200,
                            child: ListView.builder(
                                itemCount: _controller.movieUpcoming.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        FilmContainer(
                                          function: () {
                                            Get.to(() => WatchScreen(
                                                  movieModel: _controller
                                                      .movieUpcoming[index],
                                                ));
                                          },
                                          image:
                                              "https://image.tmdb.org/t/p/w500/" +
                                                  _controller
                                                      .movieUpcoming[index]
                                                      .backPoster,
                                          popularity: _controller
                                              .movieUpcoming[index].popularity
                                              .toInt()
                                              .toString(),
                                        ))),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Top Rated",
                                style:
                                    TextStyle(color: K.textColor, fontSize: 18),
                              ),
                              Text(
                                "All",
                                style: TextStyle(
                                    color: K.secondColor, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 265,
                          child: ListView.builder(
                              itemCount: _controller.movie.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) =>
                                  FilmCard(
                                    function: () {
                                      Get.to(() => WatchScreen(
                                            movieModel:
                                                _controller.movie[index],
                                          ));
                                    },
                                    name: _controller.movie[index].title,
                                    rate: _controller.movie[index].rating
                                        .toString(),
                                    image: "https://image.tmdb.org/t/p/w500/" +
                                        _controller.movie[index].poster,
                                  )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Popular",
                                style:
                                    TextStyle(color: K.textColor, fontSize: 18),
                              ),
                              Text(
                                "All",
                                style: TextStyle(
                                    color: K.secondColor, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 265,
                          child: ListView.builder(
                              itemCount: _controller.moviePopular.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) =>
                                  FilmCard(
                                    name: _controller.moviePopular[index].title,
                                    rate: _controller.moviePopular[index].rating
                                        .toString(),
                                    function: () {
                                      Get.to(() => WatchScreen(
                                            movieModel:
                                                _controller.moviePopular[index],
                                          ));
                                    },
                                    image: "https://image.tmdb.org/t/p/w500/" +
                                        _controller.moviePopular[index].poster,
                                  )),
                        ),
                      ],
                    ),
                  ),
          )),
    );
  }
}
