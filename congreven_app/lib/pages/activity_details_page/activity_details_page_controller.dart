import 'package:mobx/mobx.dart';
part 'activity_details_page_controller.g.dart';

class ActivityDetailsPageController = _ActivityDetailsPageControllerBase
    with _$ActivityDetailsPageController;

abstract class _ActivityDetailsPageControllerBase with Store {
  @observable
  dynamic activityToUse;

  @action
  void changeActivityToUse(event) {
    activityToUse = event;
  }

  @observable
  bool isFetchingActivityToUse = false;

  @action
  void changeIsFetchingActitityToUse(bool status) {
    isFetchingActivityToUse = status;
  }

  @observable
  String errorMessage = "";

  @action
  void changeFetchingActivitiesErrorMessage(String message) {
    errorMessage = message;
  }
}
