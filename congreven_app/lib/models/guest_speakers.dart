import 'package:mobx/mobx.dart';
part 'guest_speakers.g.dart';

class GuestSpeakers = _GuestSpeakersBase with _$GuestSpeakers;

abstract class _GuestSpeakersBase with Store {
  @observable
  ObservableList<dynamic> guestSpeakers =
      ObservableList<dynamic>().asObservable();

  @action
  void updateGuestSpeakers(List<dynamic> newGuestSpeakers) {
    ObservableList<dynamic> temp = ObservableList<dynamic>();
    temp.addAll(newGuestSpeakers);
    guestSpeakers = temp;
  }

  @action
  void addGuestSpeaker(dynamic newGuestSpeaker) {
    guestSpeakers.add(newGuestSpeaker);
  }

  @action
  void removeGuestSpeaker(dynamic guestSpeaker) {
    guestSpeakers.removeWhere((element) => element["id"] == guestSpeaker["id"]);
  }

  @observable
  bool isFetchingGuestSpeakers = false;

  @action
  void changeIsFetchingGuestSpeakers(bool status) {
    isFetchingGuestSpeakers = status;
  }

  @observable
  String errorMessage = "";

  @action
  void changeFetchingGuestSpeakersErrorMessage(String message) {
    errorMessage = message;
  }

  @action
  void clean() {
    guestSpeakers = ObservableList<dynamic>().asObservable();
    isFetchingGuestSpeakers = false;
    errorMessage = "";
  }
}
