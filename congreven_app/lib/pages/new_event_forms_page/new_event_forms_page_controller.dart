import 'package:mobx/mobx.dart';
part 'new_event_forms_page_controller.g.dart';

class NewEventFormsPageController = _NewEventFormsPageControllerBase
    with _$NewEventFormsPageController;

abstract class _NewEventFormsPageControllerBase with Store {
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
  String address;

  @action
  void changeAddress(String newAddress) => address = newAddress;

  @observable
  String startDate;

  @action
  void changeStartDate(String newStartDate) => startDate =
      newStartDate.length >= 10 ? newStartDate.substring(0, 10) : newStartDate;

  @observable
  String endDate;

  @action
  void changeEndDate(String newEndDate) => endDate =
      newEndDate.length >= 10 ? newEndDate.substring(0, 10) : newEndDate;

  @observable
  String description;

  @action
  void changeDescription(String newDescription) => description = newDescription;

  @observable
  String ownerDescription;

  @action
  void changeOwnerDescription(String newOwnerDescription) =>
      ownerDescription = newOwnerDescription;

  @observable
  bool isOwner = true;

  @action
  void changeIsOwner(bool status) {
    isOwner = status;
  }

  @observable
  String startHour;

  @action
  void changeStartHour(String newStartHour) => startHour =
      newStartHour.length >= 5 ? newStartHour.substring(0, 5) : newStartHour;

  @observable
  String endHour;

  @action
  void changeEndHour(String newEndHour) => endHour =
      newEndHour.length >= 5 ? newEndHour.substring(0, 5) : newEndHour;

  @observable
  ObservableList<dynamic> selectedOrganizers =
      ObservableList<dynamic>().asObservable();

  @action
  void addOrganizerToEvent(dynamic newOrganizer) {
    selectedOrganizers.add(newOrganizer);
  }

  @action
  void removeOrganizerFromEvent(dynamic organizer) {
    selectedOrganizers
        .removeWhere((element) => element["cnpj"] == organizer["cnpj"]);
  }

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

  bool validateHhMm(String hour) {
    final isValid =
        RegExp(r'^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$').hasMatch(hour);
    return isValid;
  }

  String validateStartHour() {
    if (canValidate) {
      if (startHour == null || startHour.isEmpty) {
        return "O campo 'hora inicial' é obrigatório!";
      } else if (startHour.length < 5 || !validateHhMm(startHour)) {
        return "Insira uma data valida!";
      }
    }
    return null;
  }

  String validateEndHour() {
    if (canValidate) {
      if (endHour == null || endHour.isEmpty) {
        return "O campo 'hora final' é obrigatório!";
      } else if (endHour.length < 5 || !validateHhMm(endHour)) {
        return "Insira uma data valida!";
      }
    }
    return null;
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

  String validateAddress() {
    if (canValidate) {
      if (address == null || address.isEmpty) {
        return "O campo 'endereço' é obrigatório!";
      }
    }
    return null;
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

  bool firstDateIsBeforeSecondDate(String firstDate, String secondDate) {
    if (firstDate == secondDate) {
      return true;
    }
    final DateTime firstDateFormatted = formatDate(reverseDate(firstDate));
    final DateTime secondDateFormatted = formatDate(reverseDate(secondDate));
    return firstDateFormatted.isBefore(secondDateFormatted);
  }

  String validateStartDate() {
    if (canValidate) {
      if (startDate == null || startDate.isEmpty) {
        return "O campo 'data inicial' é obrigatório!";
      } else if (startDate.length < 10) {
        return "Insira uma data inicial válida!";
      } else if (startDate.length == 10) {
        if (!isValidDate(startDate)) {
          return "Insira uma data inicial válida!";
        }
        if (endDate?.length == 10) {
          if (!firstDateIsBeforeSecondDate(startDate, endDate)) {
            return "A data inicial não pode ser maior que a data final!";
          }
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

  String validateEndDate() {
    if (canValidate) {
      if (endDate == null || endDate.isEmpty) {
        return "O campo 'data final' é obrigatório!";
      } else if (endDate.length < 10) {
        return "Insira uma data final válida!";
      } else if (endDate.length == 10) {
        if (!isValidDate(endDate)) {
          return "Insira uma data final válida!";
        }
        if (startDate?.length == 10) {
          if (!firstDateIsBeforeSecondDate(startDate, endDate)) {
            return "A data final não pode ser menor que a data inicial!";
          }
        }
      }
    }
    return null;
  }

  String validateDescription() {
    if (canValidate) {
      if (description == null || description.isEmpty) {
        return "O campo 'descrição do evento' é obrigatório!";
      }
    }
    return null;
  }

  String validateOwnerDescription() {
    if (canValidate) {
      if (!isOwner) {
        return null;
      }
      if (ownerDescription == null || ownerDescription.isEmpty) {
        return "O campo 'descrição do proprietário' é obrigatório!";
      }
    }
    return null;
  }

  String validateSelectedOrganizer() {
    if (canValidate) {
      if (isOwner) {
        return null;
      }
      if (selectedOrganizers.isEmpty || selectedOrganizers == null) {
        return "pelo menos um organizador é necessário para o evento!";
      }
    }
    return null;
  }

  @action
  void clean() {
    name = null;
    address = null;
    startDate = null;
    endDate = null;
    description = null;
    ownerDescription = null;
    selectedOrganizers = ObservableList<dynamic>();
    canValidate = false;
    startHour = null;
    endHour = null;
  }

  @computed
  get eventToRegister => {
        "name": name,
        "address": address,
        "start_date": "${reverseDate(startDate)} $startHour",
        "end_date": "${reverseDate(endDate)} $endHour",
        "description": description,
        "owner_description": ownerDescription,
        "organizers":
            selectedOrganizers.map((element) => element["cnpj"]).toList()
      };

  @computed
  get isValid =>
      validateName() == null &&
      validateAddress() == null &&
      validateStartDate() == null &&
      validateEndDate() == null &&
      validateDescription() == null &&
      validateSelectedOrganizer() == null &&
      validateOwnerDescription() == null &&
      validateStartHour() == null &&
      validateEndHour() == null &&
      canValidate;
}
