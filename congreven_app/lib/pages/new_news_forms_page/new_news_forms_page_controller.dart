import 'package:mobx/mobx.dart';
part 'new_news_forms_page_controller.g.dart';

class NewNewsFormsPageController = _NewNewsFormsPageControllerBase
    with _$NewNewsFormsPageController;

abstract class _NewNewsFormsPageControllerBase with Store {
  @observable
  bool hasSubmitted = false;

  @action
  void changeHasSubmitted(bool status) {
    hasSubmitted = status;
  }

  @observable
  String name;

  @action
  void changeName(String newName) => name = newName;

  @observable
  String date;

  @action
  void changeDate(String newDate) =>
      date = newDate.length >= 10 ? newDate.substring(0, 10) : newDate;

  @observable
  String description;

  @action
  void changeDescription(String newDescription) => description = newDescription;

  @observable
  bool isLoadingSomeAction = false;

  @action
  void changeIsLoadingSomeAction(bool status) {
    isLoadingSomeAction = status;
  }

  @observable
  bool canValidate = false;

  @action
  void changeCanValidate(bool status) {
    canValidate = status;
  }

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
    if (canValidate) {
      if (date == null || date.isEmpty) {
        return "O campo 'data' é obrigatório!";
      } else if (date.length < 10) {
        return "Insira uma data válida!";
      } else if (date.length == 10) {
        if (!isValidDate(date)) {
          return "Insira uma data válida!";
        }
      }
    }
    return null;
  }

  String validateName() {
    if (canValidate) {
      if (name == null || name.isEmpty) {
        return "O campo 'nome' é obrigatório!";
      }
    }
    return null;
  }

  String validateDescription() {
    if (canValidate) {
      if (description == null || description.isEmpty) {
        return "O campo 'descrição' é obrigatório!";
      }
    }
    return null;
  }

  @action
  void clean() {
    name = null;
    date = null;
    description = null;
    canValidate = false;
  }

  @computed
  get newsToRegister => {
        "name": name,
        "ndate": reverseDate(date),
        "description": description,
      };

  @computed
  get isValid =>
      validateName() == null &&
      validateDate() == null &&
      validateDescription() == null &&
      canValidate;
}
