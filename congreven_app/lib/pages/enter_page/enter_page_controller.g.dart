// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enter_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EnterPageController on _EnterPageControllerBase, Store {
  final _$isLoadingEnterButtonAtom =
      Atom(name: '_EnterPageControllerBase.isLoadingEnterButton');

  @override
  bool get isLoadingEnterButton {
    _$isLoadingEnterButtonAtom.reportRead();
    return super.isLoadingEnterButton;
  }

  @override
  set isLoadingEnterButton(bool value) {
    _$isLoadingEnterButtonAtom.reportWrite(value, super.isLoadingEnterButton,
        () {
      super.isLoadingEnterButton = value;
    });
  }

  final _$isLoadingAppAtom =
      Atom(name: '_EnterPageControllerBase.isLoadingApp');

  @override
  bool get isLoadingApp {
    _$isLoadingAppAtom.reportRead();
    return super.isLoadingApp;
  }

  @override
  set isLoadingApp(bool value) {
    _$isLoadingAppAtom.reportWrite(value, super.isLoadingApp, () {
      super.isLoadingApp = value;
    });
  }

  final _$_EnterPageControllerBaseActionController =
      ActionController(name: '_EnterPageControllerBase');

  @override
  void changeIsLoadingEnterButton(bool status) {
    final _$actionInfo = _$_EnterPageControllerBaseActionController.startAction(
        name: '_EnterPageControllerBase.changeIsLoadingEnterButton');
    try {
      return super.changeIsLoadingEnterButton(status);
    } finally {
      _$_EnterPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoadingApp(bool status) {
    final _$actionInfo = _$_EnterPageControllerBaseActionController.startAction(
        name: '_EnterPageControllerBase.changeIsLoadingApp');
    try {
      return super.changeIsLoadingApp(status);
    } finally {
      _$_EnterPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadingEnterButton: ${isLoadingEnterButton},
isLoadingApp: ${isLoadingApp}
    ''';
  }
}
