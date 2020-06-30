import 'package:mobx/mobx.dart';
part 'guest_speaker_page_controller.g.dart';

class GuestSpeakerPageController = _GuestSpeakerPageControllerBase
    with _$GuestSpeakerPageController;

abstract class _GuestSpeakerPageControllerBase with Store {
  @observable
  bool isFetchingGuestSpeaker = false;

  @action
  void changeIsFetchingGuestSpeaker(bool status) {
    isFetchingGuestSpeaker = status;
  }

  @observable
  ObservableList selectedGuestSpeakers = ObservableList().asObservable();

  @action
  void updateSelectedGuestSpeaker(dynamic guestSpeakers) {
    var temp = ObservableList();
    temp.addAll(guestSpeakers);
    selectedGuestSpeakers = temp;
  }

  @action
  void addSelectedGuestSpeaker(dynamic guestSpeaker) {
    selectedGuestSpeakers.add(guestSpeaker);
  }

  @action
  void removeSelectedGuestSpeaker(dynamic guestSpeaker) {
    selectedGuestSpeakers
        .removeWhere((element) => element["rg"] == guestSpeaker["rg"]);
  }
}
