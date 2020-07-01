// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_organizer_forms_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewOrganizerFormsPageController
    on _NewOrganizerFormsPageControllerBase, Store {
  Computed<dynamic> _$organizerToRegisterComputed;

  @override
  dynamic get organizerToRegister => (_$organizerToRegisterComputed ??=
          Computed<dynamic>(() => super.organizerToRegister,
              name: '_NewOrganizerFormsPageControllerBase.organizerToRegister'))
      .value;
  Computed<dynamic> _$isValidComputed;

  @override
  dynamic get isValid =>
      (_$isValidComputed ??= Computed<dynamic>(() => super.isValid,
              name: '_NewOrganizerFormsPageControllerBase.isValid'))
          .value;

  final _$isLoadingSomeActionAtom =
      Atom(name: '_NewOrganizerFormsPageControllerBase.isLoadingSomeAction');

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

  final _$nameAtom = Atom(name: '_NewOrganizerFormsPageControllerBase.name');

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

  final _$cnpjAtom = Atom(name: '_NewOrganizerFormsPageControllerBase.cnpj');

  @override
  String get cnpj {
    _$cnpjAtom.reportRead();
    return super.cnpj;
  }

  @override
  set cnpj(String value) {
    _$cnpjAtom.reportWrite(value, super.cnpj, () {
      super.cnpj = value;
    });
  }

  final _$descriptionAtom =
      Atom(name: '_NewOrganizerFormsPageControllerBase.description');

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

  final _$isEdittingAtom =
      Atom(name: '_NewOrganizerFormsPageControllerBase.isEditting');

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

  final _$organizerToEditAtom =
      Atom(name: '_NewOrganizerFormsPageControllerBase.organizerToEdit');

  @override
  dynamic get organizerToEdit {
    _$organizerToEditAtom.reportRead();
    return super.organizerToEdit;
  }

  @override
  set organizerToEdit(dynamic value) {
    _$organizerToEditAtom.reportWrite(value, super.organizerToEdit, () {
      super.organizerToEdit = value;
    });
  }

  final _$canValidateAtom =
      Atom(name: '_NewOrganizerFormsPageControllerBase.canValidate');

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

  final _$_NewOrganizerFormsPageControllerBaseActionController =
      ActionController(name: '_NewOrganizerFormsPageControllerBase');

  @override
  void changeIsLoadingSomeAction(bool status) {
    final _$actionInfo =
        _$_NewOrganizerFormsPageControllerBaseActionController.startAction(
            name:
                '_NewOrganizerFormsPageControllerBase.changeIsLoadingSomeAction');
    try {
      return super.changeIsLoadingSomeAction(status);
    } finally {
      _$_NewOrganizerFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeName(String newName) {
    final _$actionInfo = _$_NewOrganizerFormsPageControllerBaseActionController
        .startAction(name: '_NewOrganizerFormsPageControllerBase.changeName');
    try {
      return super.changeName(newName);
    } finally {
      _$_NewOrganizerFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeCnpj(String newCnpj) {
    final _$actionInfo = _$_NewOrganizerFormsPageControllerBaseActionController
        .startAction(name: '_NewOrganizerFormsPageControllerBase.changeCnpj');
    try {
      return super.changeCnpj(newCnpj);
    } finally {
      _$_NewOrganizerFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeDescription(String newDescription) {
    final _$actionInfo =
        _$_NewOrganizerFormsPageControllerBaseActionController.startAction(
            name: '_NewOrganizerFormsPageControllerBase.changeDescription');
    try {
      return super.changeDescription(newDescription);
    } finally {
      _$_NewOrganizerFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsEditting(bool status) {
    final _$actionInfo =
        _$_NewOrganizerFormsPageControllerBaseActionController.startAction(
            name: '_NewOrganizerFormsPageControllerBase.changeIsEditting');
    try {
      return super.changeIsEditting(status);
    } finally {
      _$_NewOrganizerFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeOrganizerToEdit(dynamic organizer) {
    final _$actionInfo =
        _$_NewOrganizerFormsPageControllerBaseActionController.startAction(
            name: '_NewOrganizerFormsPageControllerBase.changeOrganizerToEdit');
    try {
      return super.changeOrganizerToEdit(organizer);
    } finally {
      _$_NewOrganizerFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeCanValidate(bool status) {
    final _$actionInfo =
        _$_NewOrganizerFormsPageControllerBaseActionController.startAction(
            name: '_NewOrganizerFormsPageControllerBase.changeCanValidate');
    try {
      return super.changeCanValidate(status);
    } finally {
      _$_NewOrganizerFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void clean() {
    final _$actionInfo = _$_NewOrganizerFormsPageControllerBaseActionController
        .startAction(name: '_NewOrganizerFormsPageControllerBase.clean');
    try {
      return super.clean();
    } finally {
      _$_NewOrganizerFormsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadingSomeAction: ${isLoadingSomeAction},
name: ${name},
cnpj: ${cnpj},
description: ${description},
isEditting: ${isEditting},
organizerToEdit: ${organizerToEdit},
canValidate: ${canValidate},
organizerToRegister: ${organizerToRegister},
isValid: ${isValid}
    ''';
  }
}
