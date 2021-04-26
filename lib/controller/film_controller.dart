import 'package:movie/controller/basecontroller.dart';
import 'package:movie/enum/viewstate.dart';
import 'package:movie/model/film_model.dart';
import 'package:movie/model/series_model.dart';
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
  final _seriesPopular = <SeriesModel>[].obs;
  final _seriesTopRated = <SeriesModel>[].obs;
  final _series = <SeriesModel>[].obs;
  final _video = <Video>[].obs;
  final _videoSeries = <Video>[].obs;
  int id;
  Future<void> launched;
  final _url = 'https://www.cimaclub.store/watch/'.obs;

  List<MovieModel> get movie => _movie;

  List<MovieModel> get moviePopular => _moviePopular;

  List<MovieModel> get movieUpcoming => _movieUpcoming;

  List<SeriesModel> get seriesPopular => _seriesPopular;

  List<SeriesModel> get seriesTopRated => _seriesTopRated;

  List<SeriesModel> get series => _series;

  List<Video> get video => _video;

  List<Video> get videoSeries => _videoSeries;

  String get url => _url.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    setSate(ViewState.busy);
    await getTopRatedMovies();
    await getPopularMovies();
    await getupComingMovies();
    await getPopularSeries();
    await getTopRatedSeries();
    setSate(ViewState.idle);
  }

  getTopRatedMovies() async {
    _movie.assignAll(await _filmServices.getTopRateMovies());
  }

  getPopularMovies() async {
    _moviePopular.assignAll(await _filmServices.getPopularMovies());
  }

  getupComingMovies() async {
    _movieUpcoming.assignAll(await _filmServices.getUpComing());
  }

  getPopularSeries() async {
    _seriesPopular.assignAll(await _filmServices.getPopularSeries());
  }

  getTopRatedSeries() async {
    _seriesTopRated.assignAll(await _filmServices.getTopRatedSeries());
  }

  getVideo(int id) async {
    _video.assignAll(await _filmServices.getMovieVideos(id));
  }

  getVideoSeries(int id) async {
    _videoSeries.assignAll(await _filmServices.getSeriesVideos(id));
  }

  // getSimilar(int id) async {
  //   _series.assignAll(await _filmServices.getSeriesSimilar(id));
  // }

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
