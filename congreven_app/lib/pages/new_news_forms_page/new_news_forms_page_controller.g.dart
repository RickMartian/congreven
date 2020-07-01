// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_news_forms_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewNewsFormsPageController on _NewNewsFormsPageControllerBase, Store {
  Computed<dynamic> _$newsToRegisterComputed;

  @override
  dynamic get newsToRegister => (_$newsToRegisterComputed ??= Computed<dynamic>(
          () => super.newsToRegister,
          name: '_NewNewsFormsPageControllerBase.newsToRegister'))
      .value;
  Computed<dynamic> _$isValidComputed;

  @override
  dynamic get isValid =>
      (_$isValidComputed ??= Computed<dynamic>(() => super.isValid,
              name: '_NewNewsFormsPageControllerBase.isValid'))
          .value;

  final _$hasSubmittedAtom =
      Atom(name: '_NewNewsFormsPageControllerBase.hasSubmitted');

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

  final _$nameAtom = Atom(name: '_NewNewsFormsPageControllerBase.name');

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

  final _$dateAtom = Atom(name: '_NewNewsFormsPageControllerBase.date');

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

  final _$descriptionAtom =
      Atom(name: '_NewNewsFormsPageControllerBase.description');

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

  final _$isLoadingSomeActionAtom =
      Atom(name: '_NewNewsFormsPageControllerBase.isLoadingSomeAction');

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

  final _$canValidateAtom =
      Atom(name: '_NewNewsFormsPageControllerBase.canValidate');

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

  final _$_NewNewsFormsPageControllerBaseActionController =
      ActionController(name: '_NewNewsFormsPageControllerBase');

  @override
  void changeHasSubmitted(bool status) {
    final _$actionInfo =
        _$_NewNewsFormsPageControllerBaseActionController.startAction(
            name: '_NewNewsFormsPageControllerBase.changeHasSubmitted');
    try {
      return super.changeHasSubmitted(status);
    } finally {
      _$_NewNewsFormsPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeName(String newName) {
    final _$actionInfo = _$_NewNewsFormsPageControllerBaseActionController
        .startAction(name: '_NewNewsFormsPageControllerBase.changeName');
    try {
      return super.changeName(newName);
    } finally {
      _$_NewNewsFormsPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDate(String newDate) {
    final _$actionInfo = _$_NewNewsFormsPageControllerBaseActionController
        .startAction(name: '_NewNewsFormsPageControllerBase.changeDate');
    try {
      return super.changeDate(newDate);
    } finally {
      _$_NewNewsFormsPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDescription(String newDescription) {
    final _$actionInfo = _$_NewNewsFormsPageControllerBaseActionController
        .startAction(name: '_NewNewsFormsPageControllerBase.changeDescription');
    try {
      return super.changeDescription(newDescription);
    } finally {
      _$_NewNewsFormsPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoadingSomeAction(bool status) {
    final _$actionInfo =
        _$_NewNewsFormsPageControllerBaseActionController.startAction(
            name: '_NewNewsFormsPageControllerBase.changeIsLoadingSomeAction');
    try {
      return super.changeIsLoadingSomeAction(status);
    } finally {
      _$_NewNewsFormsPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCanValidate(bool status) {
    final _$actionInfo = _$_NewNewsFormsPageControllerBaseActionController
        .startAction(name: '_NewNewsFormsPageControllerBase.changeCanValidate');
    try {
      return super.changeCanValidate(status);
    } finally {
      _$_NewNewsFormsPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clean() {
    final _$actionInfo = _$_NewNewsFormsPageControllerBaseActionController
        .startAction(name: '_NewNewsFormsPageControllerBase.clean');
    try {
      return super.clean();
    } finally {
      _$_NewNewsFormsPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasSubmitted: ${hasSubmitted},
name: ${name},
date: ${date},
description: ${description},
isLoadingSomeAction: ${isLoadingSomeAction},
canValidate: ${canValidate},
newsToRegister: ${newsToRegister},
isValid: ${isValid}
    ''';
  }
}
