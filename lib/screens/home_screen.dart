import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/component/container_film.dart';
import 'package:movie/component/film_card.dart';
import 'package:movie/component/loading.dart';
import 'package:movie/constant.dart';
import 'package:movie/controller/film_controller.dart';
import 'package:movie/enum/viewstate.dart';
import 'package:movie/screens/screen_play_series.dart';
import 'package:movie/screens/screen_watch.dart';

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
                ? LoadingWidget()
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Premier",
                            style: TextStyle(color: K.textColor, fontSize: 18),
                          ),
                        ),
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 180,
                            autoPlay: true,
                          ),
                          itemCount: _controller.movieUpcoming.length,
                          itemBuilder: (context, itemIndex, realIndex) {
                            return FilmContainer(
                              function: () {
                                _controller.getVideo(
                                    _controller.movieUpcoming[itemIndex].id);
                                Get.to(() => WatchScreen(
                                      movieModel:
                                          _controller.movieUpcoming[itemIndex],
                                    ));
                              },
                              image: "https://image.tmdb.org/t/p/w500/" +
                                  _controller.movieUpcoming[itemIndex].poster,
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Text(
                            "Top Rated",
                            style: TextStyle(color: K.textColor, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                              itemCount: _controller.movie.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) =>
                                  FilmCard(
                                    function: () {
                                      _controller.getVideo(
                                          _controller.movie[index].id);
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
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Popular",
                            style: TextStyle(color: K.textColor, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                              itemCount: _controller.moviePopular.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) =>
                                  FilmCard(
                                    name: _controller.moviePopular[index].title,
                                    rate: _controller.moviePopular[index].rating
                                        .toString(),
                                    function: () {
                                      _controller.getVideo(
                                          _controller.moviePopular[index].id);
                                      Get.to(() => WatchScreen(
                                            movieModel:
                                                _controller.moviePopular[index],
                                          ));
                                    },
                                    image: "https://image.tmdb.org/t/p/w500/" +
                                        _controller.moviePopular[index].poster,
                                  )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Series Popular",
                            style: TextStyle(color: K.textColor, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                              itemCount: _controller.seriesPopular.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) =>
                                  FilmCard(
                                    name: _controller.seriesPopular[index].name,
                                    rate: _controller
                                        .seriesPopular[index].voteAverage
                                        .toString(),
                                    function: () {
                                      Get.to(() => WatchSeriesScreen(
                                            seriesModel: _controller
                                                .seriesPopular[index],
                                          ));
                                    },
                                    image: "https://image.tmdb.org/t/p/w500/" +
                                        _controller
                                            .seriesPopular[index].posterPath,
                                  )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Top Rated Series",
                            style: TextStyle(color: K.textColor, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                              itemCount: _controller.seriesTopRated.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) =>
                                  FilmCard(
                                    name:
                                        _controller.seriesTopRated[index].name,
                                    rate: _controller
                                        .seriesTopRated[index].voteAverage
                                        .toString(),
                                    function: () {
                                      _controller.getVideoSeries(
                                          _controller.seriesTopRated[index].id);
                                      Get.to(() => WatchSeriesScreen(
                                            seriesModel: _controller
                                                .seriesTopRated[index],
                                          ));
                                      _controller.getVideoSeries(
                                          _controller.seriesTopRated[index].id);
                                    },
                                    image: "https://image.tmdb.org/t/p/w500/" +
                                        _controller
                                            .seriesTopRated[index].posterPath,
                                  )),
                        ),
                      ],
                    ),
                  ),
          )),
    );
  }
}
