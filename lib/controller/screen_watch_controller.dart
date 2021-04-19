import 'package:movie/controller/basecontroller.dart';
import 'package:movie/enum/viewstate.dart';
import 'package:movie/model/person_model.dart';
import 'package:get/get.dart';
import 'package:movie/services/film_services.dart';

class ScreenWatchController extends BaseController {
  FilmServices _filmServices = new FilmServices();

  final _person = <Person>[].obs;

  List<Person> get person => _person;

  @override
  Future<void> onInit() async {
    super.onInit();
    setSate(ViewState.busy);
    getPeople();
    setSate(ViewState.idle);
  }

  getPeople() async {
    _person.assignAll(await _filmServices.getPersons());
  }
}
