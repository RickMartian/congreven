import 'package:mobx/mobx.dart';
part 'organizer.g.dart';

class Organizer = _OrganizerBase with _$Organizer;

abstract class _OrganizerBase with Store {
  @observable
  ObservableList<dynamic> organizers = ObservableList<dynamic>().asObservable();

  @action
  void updateOrganizers(List<dynamic> newOrganizers) {
    ObservableList<dynamic> temp = ObservableList<dynamic>();
    temp.addAll(newOrganizers);
    organizers = temp;
  }

  @action
  void addOrganizer(dynamic newOrganizer) {
    organizers.add(newOrganizer);
  }

  @action
  void removeOrganizer(dynamic organizer) {
    organizers.removeWhere((element) => element["cnpj"] == organizer["cnpj"]);
  }
}
