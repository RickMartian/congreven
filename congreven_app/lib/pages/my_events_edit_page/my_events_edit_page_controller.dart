import 'package:mobx/mobx.dart';
part 'my_events_edit_page_controller.g.dart';

class MyEventsEditPageController = _MyEventsEditPageControllerBase
    with _$MyEventsEditPageController;

abstract class _MyEventsEditPageControllerBase with Store {
  @observable
  dynamic eventToEdit;

  @action
  void changeEventToEdit(event) {
    eventToEdit = event;
  }
}
