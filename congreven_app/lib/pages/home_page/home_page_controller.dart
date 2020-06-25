import 'package:mobx/mobx.dart';
part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  @observable
  bool isLoadingLogout = false;

  @action
  void changeIsLoadingLogout(bool status) {
    isLoadingLogout = status;
  }
}
