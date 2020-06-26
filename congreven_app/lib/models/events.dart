import 'package:mobx/mobx.dart';
part 'events.g.dart';

class Events = _EventsBase with _$Events;

abstract class _EventsBase with Store {
  ObservableList<Map<String, dynamic>> events =
      List<Map<String, dynamic>>().asObservable();
}
