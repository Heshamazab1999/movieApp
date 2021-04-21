import 'package:movie/controller/basecontroller.dart';
import 'package:movie/enum/viewstate.dart';
import 'package:movie/model/film_model.dart';
import 'package:movie/model/person_model.dart';
import 'package:movie/model/video_model.dart';
import 'package:movie/services/film_services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class FilmController extends BaseController {
  static FilmController to = Get.find();
  FilmServices _filmServices = new FilmServices();
  final _movie = <MovieModel>[].obs;
  final _moviePopular = <MovieModel>[].obs;
  final _movieUpcoming = <MovieModel>[].obs;
  final _person = <Person>[].obs;
  final _video = <Video>[].obs;
  int id;
  Future<void> launched;
  final _url = 'https://www.cimaclub.store/watch/'.obs;

  List<MovieModel> get movie => _movie;

  List<MovieModel> get moviePopular => _moviePopular;

  List<MovieModel> get movieUpcoming => _movieUpcoming;

  List<Video> get video => _video;

  List<Person> get person => _person;
  String get url => _url.value;
  @override
  Future<void> onInit() async {
    super.onInit();
    setSate(ViewState.busy);
    await getTopRatedMovies();
    await getPopularMovies();
    await getPerson();
    await getupComingMovies();
    setSate(ViewState.idle);
  }

  getTopRatedMovies() async {
    _movie.assignAll(await _filmServices.getTopRateMovies());
  }

  getPopularMovies() async {
    _moviePopular.assignAll(await _filmServices.getPopularMovies());
  }

  getPerson() async {
    _person.assignAll(await _filmServices.getPersons());
  }

  getupComingMovies() async {
    _movieUpcoming.assignAll(await _filmServices.getUpComing());
  }

  getVideo(int id) async {
    _video.assignAll(await _filmServices.getMovieVideos(id));
  }

  int calculate(int a, int b) {
    var c = a + b;
    print(c);
    return c;
  }
  Future<void> viewFilm(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
