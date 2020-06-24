import 'package:mobx/mobx.dart';
part 'enter_page_controller.g.dart';

class EnterPageController = _EnterPageControllerBase with _$EnterPageController;

abstract class _EnterPageControllerBase with Store {
  @observable
  bool isLoadingEnterButton = false;

  @action
  void changeIsLoadingEnterButton(bool status) {
    isLoadingEnterButton = status;
  }

  @observable
  bool isLoadingApp = true;

  @action
  void changeIsLoadingApp(bool status) {
    isLoadingApp = status;
  }
}
