// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyAccountPageController on _MyAccountPageControllerBase, Store {
  Computed<dynamic> _$isValidComputed;

  @override
  dynamic get isValid =>
      (_$isValidComputed ??= Computed<dynamic>(() => super.isValid,
              name: '_MyAccountPageControllerBase.isValid'))
          .value;
  Computed<dynamic> _$userToUpdateComputed;

  @override
  dynamic get userToUpdate =>
      (_$userToUpdateComputed ??= Computed<dynamic>(() => super.userToUpdate,
              name: '_MyAccountPageControllerBase.userToUpdate'))
          .value;

  final _$isLoadingSomeActionAtom =
      Atom(name: '_MyAccountPageControllerBase.isLoadingSomeAction');

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

  final _$nameAtom = Atom(name: '_MyAccountPageControllerBase.name');

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

  final _$_MyAccountPageControllerBaseActionController =
      ActionController(name: '_MyAccountPageControllerBase');

  @override
  void changeIsLoadingSomeAction(bool status) {
    final _$actionInfo =
        _$_MyAccountPageControllerBaseActionController.startAction(
            name: '_MyAccountPageControllerBase.changeIsLoadingSomeAction');
    try {
      return super.changeIsLoadingSomeAction(status);
    } finally {
      _$_MyAccountPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeName(String newName) {
    final _$actionInfo = _$_MyAccountPageControllerBaseActionController
        .startAction(name: '_MyAccountPageControllerBase.changeName');
    try {
      return super.changeName(newName);
    } finally {
      _$_MyAccountPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadingSomeAction: ${isLoadingSomeAction},
name: ${name},
isValid: ${isValid},
userToUpdate: ${userToUpdate}
    ''';
  }
}
