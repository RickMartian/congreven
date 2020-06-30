import 'package:mobx/mobx.dart';
part 'activities.g.dart';

class Activities = _ActivitiesBase with _$Activities;

abstract class _ActivitiesBase with Store {
  @observable
  ObservableList<dynamic> activities = ObservableList<dynamic>().asObservable();

  @action
  void updateActivities(List<dynamic> newActivities) {
    ObservableList<dynamic> temp = ObservableList<dynamic>();
    temp.addAll(newActivities);
    activities = temp;
  }

  @action
  void addActivity(dynamic newActivity) {
    activities.add(newActivity);
  }

  @action
  void removeActivity(dynamic activity) {
    activities.removeWhere((element) => element["id"] == activity["id"]);
  }

  @observable
  bool isFetchingActivities = false;

  @action
  void changeIsFetchingActivities(bool status) {
    isFetchingActivities = status;
  }

  @observable
  String errorMessage = "";

  @action
  void changeFetchingActivitiesErrorMessage(String message) {
    errorMessage = message;
  }

  @action
  void clean() {
    activities = ObservableList<dynamic>().asObservable();
    isFetchingActivities = false;
    errorMessage = "";
  }
}
