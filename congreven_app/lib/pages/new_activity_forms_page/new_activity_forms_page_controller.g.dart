// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_activity_forms_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewActivityFormsPageController
    on _NewActivityFormsPageControllerBase, Store {
  Computed<dynamic> _$activityToRegisterComputed;

  @override
  dynamic get activityToRegister => (_$activityToRegisterComputed ??=
          Computed<dynamic>(() => super.activityToRegister,
              name: '_NewActivityFormsPageControllerBase.activityToRegister'))
      .value;
  Computed<dynamic> _$isValidComputed;

  @override
  dynamic get isValid =>
      (_$isValidComputed ??= Computed<dynamic>(() => super.isValid,
              name: '_NewActivityFormsPageControllerBase.isValid'))
          .value;

  final _$hasSubmittedAtom =
      Atom(name: '_NewActivityFormsPageControllerBase.hasSubmitted');

  @override
  bool get hasSubmitted {
    _$hasSubmittedAtom.reportRead();
    return super.hasSubmitted;
  }

  @override
  set hasSubmitted(bool value) {
    _$hasSubmittedAtom.reportWrite(value, super.hasSubmitted, () {
      super.hasSubmitted = value;
    });
  }

  final _$nameAtom = Atom(name: '_NewActivityFormsPageControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$dateAtom = Atom(name: '_NewActivityFormsPageControllerBase.date');

  @override
  String get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(String value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$periodAtom = Atom(name: '_NewActivityFormsPageControllerBase.period');

  @override
  String get period {
    _$periodAtom.reportRead();
    return super.period;
  }

  @override
  set period(String value) {
    _$periodAtom.reportWrite(value, super.period, () {
      super.period = value;
    });
  }

  final _$startHourAtom =
      Atom(name: '_NewActivityFormsPageControllerBase.startHour');

  @override
  String get startHour {
    _$startHourAtom.reportRead();
    return super.startHour;
  }

  @override
  set startHour(String value) {
    _$startHourAtom.reportWrite(value, super.startHour, () {
      super.startHour = value;
    });
  }

  final _$endHourAtom =
      Atom(name: '_NewActivityFormsPageControllerBase.endHour');

  @override
  String get endHour {
    _$endHourAtom.reportRead();
    return super.endHour;
  }

  @override
  set endHour(String value) {
    _$endHourAtom.reportWrite(value, super.endHour, () {
      super.endHour = value;
    });
  }

  final _$isLoadingSomeActionAtom =
      Atom(name: '_NewActivityFormsPageControllerBase.isLoadingSomeAction');

  @override
  bool get isLoadingSomeAction {
    _$isLoadingSomeActionAtom.reportRead();
    return super.isLoadingSomeAction;
  }

  @override
  set isLoadingSomeAction(bool value) {
    _$isLoadingSomeActionAtom.reportWrite(value, super.isLoadingSomeAction, () {
      super.isLoadingSomeAction = value;
    });
  }

  final _$isEdittingAtom =
      Atom(name: '_NewActivityFormsPageControllerBase.isEditting');

  @override
  bool get isEditting {
    _$isEdittingAtom.reportRead();
    return super.isEditting;
  }

  @override
  set isEditting(bool value) {
    _$isEdittingAtom.reportWrite(value, super.isEditting, () {
      super.isEditting = value;
    });
  }

  final _$activityToEditAtom =
      Atom(name: '_NewActivityFormsPageControllerBase.activityToEdit');

  @override
  dynamic get activityToEdit {
    _$activityToEditAtom.reportRead();
    return super.activityToEdit;
  }

  @override
  set activityToEdit(dynamic value) {
    _$activityToEditAtom.reportWrite(value, super.activityToEdit, () {
      super.activityToEdit = value;
    });
  }

  final _$canValidateAtom =
      Atom(name: '_NewActivityFormsPageControllerBase.canValidate');

  @override
  bool get canValidate {
    _$canValidateAtom.reportRead();
    return super.canValidate;
  }

  @override
  set canValidate(bool value) {
    _$canValidateAtom.reportWrite(value, super.canValidate, () {
      super.canValidate = value;
    });
  }

  final _$_NewActivityFormsPageControllerBaseActionController =
      ActionController(name: '_NewActivityFormsPageControllerBase');

  @override
  void changeHasSubmitted(bool status) {
    final _$actionInfo =
        _$_NewActivityFormsPageControllerBaseActionController.startAction(
            name: '_NewActivityFormsPageControllerBase.changeHasSubmitted');
    try {
      return super.changeHasSubmitted(status);
    } finally {
      _$_NewActivityFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeName(String newName) {
    final _$actionInfo = _$_NewActivityFormsPageControllerBaseActionController
        .startAction(name: '_NewActivityFormsPageControllerBase.changeName');
    try {
      return super.changeName(newName);
    } finally {
      _$_NewActivityFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeDate(String newDate) {
    final _$actionInfo = _$_NewActivityFormsPageControllerBaseActionController
        .startAction(name: '_NewActivityFormsPageControllerBase.changeDate');
    try {
      return super.changeDate(newDate);
    } finally {
      _$_NewActivityFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changePeriod(String newPeriod) {
    final _$actionInfo = _$_NewActivityFormsPageControllerBaseActionController
        .startAction(name: '_NewActivityFormsPageControllerBase.changePeriod');
    try {
      return super.changePeriod(newPeriod);
    } finally {
      _$_NewActivityFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeStartHour(String newStartHour) {
    final _$actionInfo =
        _$_NewActivityFormsPageControllerBaseActionController.startAction(
            name: '_NewActivityFormsPageControllerBase.changeStartHour');
    try {
      return super.changeStartHour(newStartHour);
    } finally {
      _$_NewActivityFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeEndHour(String newEndHour) {
    final _$actionInfo = _$_NewActivityFormsPageControllerBaseActionController
        .startAction(name: '_NewActivityFormsPageControllerBase.changeEndHour');
    try {
      return super.changeEndHour(newEndHour);
    } finally {
      _$_NewActivityFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoadingSomeAction(bool status) {
    final _$actionInfo =
        _$_NewActivityFormsPageControllerBaseActionController.startAction(
            name:
                '_NewActivityFormsPageControllerBase.changeIsLoadingSomeAction');
    try {
      return super.changeIsLoadingSomeAction(status);
    } finally {
      _$_NewActivityFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsEditting(bool status) {
    final _$actionInfo =
        _$_NewActivityFormsPageControllerBaseActionController.startAction(
            name: '_NewActivityFormsPageControllerBase.changeIsEditting');
    try {
      return super.changeIsEditting(status);
    } finally {
      _$_NewActivityFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeActivityToEdit(dynamic activity) {
    final _$actionInfo =
        _$_NewActivityFormsPageControllerBaseActionController.startAction(
            name: '_NewActivityFormsPageControllerBase.changeActivityToEdit');
    try {
      return super.changeActivityToEdit(activity);
    } finally {
      _$_NewActivityFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeCanValidate(bool status) {
    final _$actionInfo =
        _$_NewActivityFormsPageControllerBaseActionController.startAction(
            name: '_NewActivityFormsPageControllerBase.changeCanValidate');
    try {
      return super.changeCanValidate(status);
    } finally {
      _$_NewActivityFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void clean() {
    final _$actionInfo = _$_NewActivityFormsPageControllerBaseActionController
        .startAction(name: '_NewActivityFormsPageControllerBase.clean');
    try {
      return super.clean();
    } finally {
      _$_NewActivityFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasSubmitted: ${hasSubmitted},
name: ${name},
date: ${date},
period: ${period},
startHour: ${startHour},
endHour: ${endHour},
isLoadingSomeAction: ${isLoadingSomeAction},
isEditting: ${isEditting},
activityToEdit: ${activityToEdit},
canValidate: ${canValidate},
activityToRegister: ${activityToRegister},
isValid: ${isValid}
    ''';
  }
}
