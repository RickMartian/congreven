import 'package:mobx/mobx.dart';
part 'organizer_page_controller.g.dart';

class OrganizerPageController = _OrganizerPageControllerBase
    with _$OrganizerPageController;

abstract class _OrganizerPageControllerBase with Store {
  @observable
  bool isFetchingOrganizer = false;

  @action
  void changeIsFetchingOrganizer(bool status) {
    isFetchingOrganizer = status;
  }
}
