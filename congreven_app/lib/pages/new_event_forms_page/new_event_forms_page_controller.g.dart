// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_event_forms_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewEventFormsPageController on _NewEventFormsPageControllerBase, Store {
  Computed<dynamic> _$eventToRegisterComputed;

  @override
  dynamic get eventToRegister => (_$eventToRegisterComputed ??=
          Computed<dynamic>(() => super.eventToRegister,
              name: '_NewEventFormsPageControllerBase.eventToRegister'))
      .value;
  Computed<dynamic> _$isValidComputed;

  @override
  dynamic get isValid =>
      (_$isValidComputed ??= Computed<dynamic>(() => super.isValid,
              name: '_NewEventFormsPageControllerBase.isValid'))
          .value;

  final _$hasSubmittedAtom =
      Atom(name: '_NewEventFormsPageControllerBase.hasSubmitted');

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

  final _$nameAtom = Atom(name: '_NewEventFormsPageControllerBase.name');

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

  final _$addressAtom = Atom(name: '_NewEventFormsPageControllerBase.address');

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$startDateAtom =
      Atom(name: '_NewEventFormsPageControllerBase.startDate');

  @override
  String get startDate {
    _$startDateAtom.reportRead();
    return super.startDate;
  }

  @override
  set startDate(String value) {
    _$startDateAtom.reportWrite(value, super.startDate, () {
      super.startDate = value;
    });
  }

  final _$endDateAtom = Atom(name: '_NewEventFormsPageControllerBase.endDate');

  @override
  String get endDate {
    _$endDateAtom.reportRead();
    return super.endDate;
  }

  @override
  set endDate(String value) {
    _$endDateAtom.reportWrite(value, super.endDate, () {
      super.endDate = value;
    });
  }

  final _$descriptionAtom =
      Atom(name: '_NewEventFormsPageControllerBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$ownerDescriptionAtom =
      Atom(name: '_NewEventFormsPageControllerBase.ownerDescription');

  @override
  String get ownerDescription {
    _$ownerDescriptionAtom.reportRead();
    return super.ownerDescription;
  }

  @override
  set ownerDescription(String value) {
    _$ownerDescriptionAtom.reportWrite(value, super.ownerDescription, () {
      super.ownerDescription = value;
    });
  }

  final _$isOwnerAtom = Atom(name: '_NewEventFormsPageControllerBase.isOwner');

  @override
  bool get isOwner {
    _$isOwnerAtom.reportRead();
    return super.isOwner;
  }

  @override
  set isOwner(bool value) {
    _$isOwnerAtom.reportWrite(value, super.isOwner, () {
      super.isOwner = value;
    });
  }

  final _$isLoadingSomeActionAtom =
      Atom(name: '_NewEventFormsPageControllerBase.isLoadingSomeAction');

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

  final _$_NewEventFormsPageControllerBaseActionController =
      ActionController(name: '_NewEventFormsPageControllerBase');

  @override
  void changeHasSubmitted(bool status) {
    final _$actionInfo =
        _$_NewEventFormsPageControllerBaseActionController.startAction(
            name: '_NewEventFormsPageControllerBase.changeHasSubmitted');
    try {
      return super.changeHasSubmitted(status);
    } finally {
      _$_NewEventFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeName(String newName) {
    final _$actionInfo = _$_NewEventFormsPageControllerBaseActionController
        .startAction(name: '_NewEventFormsPageControllerBase.changeName');
    try {
      return super.changeName(newName);
    } finally {
      _$_NewEventFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeAddress(String newAddress) {
    final _$actionInfo = _$_NewEventFormsPageControllerBaseActionController
        .startAction(name: '_NewEventFormsPageControllerBase.changeAddress');
    try {
      return super.changeAddress(newAddress);
    } finally {
      _$_NewEventFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeStartDate(String newStartDate) {
    final _$actionInfo = _$_NewEventFormsPageControllerBaseActionController
        .startAction(name: '_NewEventFormsPageControllerBase.changeStartDate');
    try {
      return super.changeStartDate(newStartDate);
    } finally {
      _$_NewEventFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeEndDate(String newEndDate) {
    final _$actionInfo = _$_NewEventFormsPageControllerBaseActionController
        .startAction(name: '_NewEventFormsPageControllerBase.changeEndDate');
    try {
      return super.changeEndDate(newEndDate);
    } finally {
      _$_NewEventFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeDescription(String newDescription) {
    final _$actionInfo =
        _$_NewEventFormsPageControllerBaseActionController.startAction(
            name: '_NewEventFormsPageControllerBase.changeDescription');
    try {
      return super.changeDescription(newDescription);
    } finally {
      _$_NewEventFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeOwnerDescription(String newOwnerDescription) {
    final _$actionInfo =
        _$_NewEventFormsPageControllerBaseActionController.startAction(
            name: '_NewEventFormsPageControllerBase.changeOwnerDescription');
    try {
      return super.changeOwnerDescription(newOwnerDescription);
    } finally {
      _$_NewEventFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsOwner(bool status) {
    final _$actionInfo = _$_NewEventFormsPageControllerBaseActionController
        .startAction(name: '_NewEventFormsPageControllerBase.changeIsOwner');
    try {
      return super.changeIsOwner(status);
    } finally {
      _$_NewEventFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoadingSomeAction(bool status) {
    final _$actionInfo =
        _$_NewEventFormsPageControllerBaseActionController.startAction(
            name: '_NewEventFormsPageControllerBase.changeIsLoadingSomeAction');
    try {
      return super.changeIsLoadingSomeAction(status);
    } finally {
      _$_NewEventFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void clean() {
    final _$actionInfo = _$_NewEventFormsPageControllerBaseActionController
        .startAction(name: '_NewEventFormsPageControllerBase.clean');
    try {
      return super.clean();
    } finally {
      _$_NewEventFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasSubmitted: ${hasSubmitted},
name: ${name},
address: ${address},
startDate: ${startDate},
endDate: ${endDate},
description: ${description},
ownerDescription: ${ownerDescription},
isOwner: ${isOwner},
isLoadingSomeAction: ${isLoadingSomeAction},
eventToRegister: ${eventToRegister},
isValid: ${isValid}
    ''';
  }
}
