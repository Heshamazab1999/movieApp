import 'package:movie/controller/basecontroller.dart';
import 'package:movie/enum/viewstate.dart';
import 'package:movie/model/person_model.dart';
import 'package:get/get.dart';
import 'package:movie/model/series_model.dart';
import 'package:movie/services/film_services.dart';
import 'package:video_player/video_player.dart';

class ScreenWatchController extends BaseController {
  FilmServices _filmServices = new FilmServices();

  VideoPlayerController controller;
  final _person = <Person>[].obs;
  final _seriesPopular = <SeriesModel>[].obs;

  List<Person> get person => _person;
  Future<void> initializeVideoPlayerFuture;

  List<SeriesModel> get seriesPopular => _seriesPopular;

  @override
  Future<void> onInit() async {
    super.onInit();
    setSate(ViewState.busy);
    await getPerson();
    await playVideo();
    setSate(ViewState.idle);
  }

  play() {
    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      // If the video is paused, play it.
      controller.play();
    }
  }

  playVideo() {
    controller = VideoPlayerController.network(
        'https://media.w3.org/2010/05/sintel/trailer.mp4');
    initializeVideoPlayerFuture = controller.initialize();
    controller.setLooping(true);
  }

  getPerson() async {
    _person.assignAll(await _filmServices.getPersons());
  }


}
