import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:movie/component/actors_card.dart';
import 'package:movie/component/container_watch.dart';
import 'package:movie/component/name_of_film.dart';
import 'package:movie/component/trailer_container.dart';
import 'package:movie/constant.dart';
import 'package:movie/controller/film_controller.dart';
import 'package:movie/model/film_model.dart';

class WatchScreen extends StatelessWidget {
  final MovieModel movieModel;

  WatchScreen({this.movieModel,});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: K.mainColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContainerWatch(
                image: "https://image.tmdb.org/t/p/w500/" + movieModel.poster,
              ),
              ContainerOfFilm(
                name: movieModel.title,
                date: movieModel.date,
                rate: movieModel.rating.toString(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  "About",
                  style: TextStyle(color: K.whiteColor),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: AutoSizeText(
                  movieModel.overview,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: K.whiteColor, fontSize: 15),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text(
                  "Watch trailer",
                  style: TextStyle(color: K.whiteColor, fontSize: 20),
                ),
              ),
              TrailerContainer(
                  id: "https://www.youtube.com/watch?v=Kf2kk8T3Z9A"),
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
                    itemCount: FilmController.to.person.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) =>
                        ActorsCard(
                          image: "https://image.tmdb.org/t/p/w300/" +
                              FilmController.to.person[index].profileImg,
                          name: FilmController.to.person[index].name,
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
