import 'package:mobx/mobx.dart';
part 'events.g.dart';

class Events = _EventsBase with _$Events;

abstract class _EventsBase with Store {
  @observable
  ObservableList<dynamic> events = ObservableList<dynamic>().asObservable();

  @action
  void updateEvents(List<dynamic> newEvents) {
    ObservableList<dynamic> temp = ObservableList<dynamic>();
    temp.addAll(newEvents);
    events = temp;
  }

  @action
  void addEvent(dynamic newEvent) {
    events.add(newEvent);
  }

  @action
  void removeEvent(dynamic event) {
    events.removeWhere((element) => element["id"] == event["id"]);
  }
}
