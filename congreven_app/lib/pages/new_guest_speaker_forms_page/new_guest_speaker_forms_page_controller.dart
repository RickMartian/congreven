import 'package:mobx/mobx.dart';
part 'new_guest_speaker_forms_page_controller.g.dart';

class NewGuestSpeakerFormsPageController = _NewGuestSpeakerFormsPageControllerBase
    with _$NewGuestSpeakerFormsPageController;

abstract class _NewGuestSpeakerFormsPageControllerBase with Store {
  @observable
  bool isLoadingSomeAction = false;

  @action
  void changeIsLoadingSomeAction(bool status) {
    isLoadingSomeAction = status;
  }

  @observable
  String name;

  @action
  void changeName(String newName) => name = newName;

  @observable
  String rg;

  @action
  void changeRg(String newRg) =>
      rg = newRg.length >= 10 ? newRg.substring(0, 12) : newRg;

  @observable
  String scholarity;

  @action
  void changeScholarity(String newScholarity) => scholarity = newScholarity;

  @observable
  String date;

  @action
  void changeDate(String newDate) =>
      date = newDate.length >= 10 ? newDate.substring(0, 10) : newDate;

  @action
  void clean() {
    name = null;
    rg = null;
    scholarity = null;
    date = null;
  }

  @observable
  bool isEditting = false;

  @action
  void changeIsEditting(bool status) {
    isEditting = status;
  }

  @computed
  get guestSpeakerToRegister => {
        "name": name,
        "rg": rg.replaceAll(RegExp(r"[^\s\w]"), ''),
        "scholarity": scholarity,
        "bdate": reverseDate(date),
      };

  String reverseDate(String date) {
    if (date != null) {
      return date.split('/').reversed.join("-");
    }
    return "";
  }

  DateTime formatDate(String date) {
    final newDateReversed = reverseDate(date);
    return DateTime.parse(newDateReversed);
  }

  String toOriginalFormatString(DateTime dateTime) {
    final y = dateTime.year.toString().padLeft(4, '0');
    final m = dateTime.month.toString().padLeft(2, '0');
    final d = dateTime.day.toString().padLeft(2, '0');
    return "$y$m$d";
  }

  bool isValidDate(String input) {
    final String inputFormatted = reverseDate(input).replaceAll("-", "");
    final DateTime date = formatDate(inputFormatted);
    final String originalFormatString = toOriginalFormatString(date);
    return inputFormatted == originalFormatString;
  }

  String validateDate() {
    if (date == null || date.isEmpty) {
      return "O campo 'data' é obrigatório!";
    } else if (date.length < 10) {
      return "Insira uma data válida!";
    } else if (date.length == 10) {
      if (!isValidDate(date)) {
        return "Insira uma data válida!";
      }
    }
    return null;
  }

  String validateScholarity() {
    if (scholarity == null || scholarity.isEmpty) {
      return "O campo 'escolaridade' é obrigatório!";
    }
    return null;
  }

  String validateName() {
    if (name == null || name.isEmpty) {
      return "O campo 'nome' é obrigatório!";
    }
    return null;
  }

  String validateRg() {
    if (rg == null || rg.isEmpty) {
      return "O campo 'rg' é obrigatório!";
    }
    return null;
  }

  @computed
  get isValid =>
      validateName() == null &&
      validateRg() == null &&
      validateDate() == null &&
      validateScholarity() == null;
}
