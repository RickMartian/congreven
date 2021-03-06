import 'package:congreven_app/pages/my_events_edit_page/my_events_edit_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'new_activity_forms_page_controller.g.dart';

class NewActivityFormsPageController = _NewActivityFormsPageControllerBase
    with _$NewActivityFormsPageController;

abstract class _NewActivityFormsPageControllerBase with Store {
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
  String period;

  @action
  void changePeriod(String newPeriod) => period = newPeriod;

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
  bool isLoadingSomeAction = false;

  @action
  void changeIsLoadingSomeAction(bool status) {
    isLoadingSomeAction = status;
  }

  @observable
  bool isEditting = false;

  @action
  void changeIsEditting(bool status) {
    isEditting = status;
  }

  @observable
  dynamic activityToEdit;

  @action
  void changeActivityToEdit(dynamic activity) {
    activityToEdit = activity;
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

  bool firstDateIsBeforeSecondDate(String firstDate, String secondDate) {
    if (firstDate.substring(0, 10) == secondDate.substring(0, 10)) {
      return true;
    }
    final DateTime firstDateFormatted =
        formatDate(reverseDate(firstDate.substring(0, 10)));
    final DateTime secondDateFormatted =
        formatDate(reverseDate(secondDate.substring(0, 10)));
    return firstDateFormatted.isBefore(secondDateFormatted);
  }

  String validateDate(BuildContext context) {
    final selectedEvent =
        Provider.of<MyEventsEditPageController>(context, listen: false);
    if (canValidate) {
      if (date == null || date.isEmpty) {
        return "O campo 'data' é obrigatório!";
      } else if (date.length < 10) {
        return "Insira uma data válida!";
      } else if (date.length == 10) {
        if (!isValidDate(date)) {
          return "Insira uma data válida!";
        } else if (selectedEvent.eventToUse != null) {
          final event = selectedEvent.eventToUse["event"];
          if (!firstDateIsBeforeSecondDate(
                  event["start_date_formatted"], date) ||
              !firstDateIsBeforeSecondDate(date, event["end_date_formatted"])) {
            return "Insira uma data dentro do intervalo do evento!";
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

  String validatePeriod() {
    if (canValidate) {
      if (period == null || period.isEmpty) {
        return "O campo 'período' é obrigatório!";
      }
    }
    return null;
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
      } else if (!validateHhMm(startHour)) {
        return "Insira uma hora valida!";
      }
    }
    return null;
  }

  String validateEndHour() {
    if (canValidate) {
      if (endHour == null || endHour.isEmpty) {
        return "O campo 'hora final' é obrigatório!";
      } else if (!validateHhMm(endHour)) {
        return "Insira uma hora valida!";
      }
    }
    return null;
  }

  @action
  void clean() {
    name = null;
    date = null;
    period = null;
    startHour = null;
    endHour = null;
    canValidate = false;
  }

  @computed
  get activityToRegister => {
        "name": name,
        "date_activity": reverseDate(date),
        "period": period,
        "start_hour": startHour,
        "end_hour": endHour,
      };

  @computed
  get isValid =>
      validateName() == null &&
      validateStartHour() == null &&
      validateEndHour() == null &&
      validatePeriod() == null &&
      canValidate;
}
