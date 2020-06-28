import 'package:mobx/mobx.dart';
part 'events_page_controller.g.dart';

class EventsPageController = _EventsPageControllerBase
    with _$EventsPageController;

abstract class _EventsPageControllerBase with Store {
  @observable
  bool isFetchingEvents = false;

  @action
  void changeIsFetchingEvents(bool status) {
    isFetchingEvents = status;
  }
}
