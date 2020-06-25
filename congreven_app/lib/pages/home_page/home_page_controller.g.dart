// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageController on _HomePageControllerBase, Store {
  final _$isLoadingLogoutAtom =
      Atom(name: '_HomePageControllerBase.isLoadingLogout');

  @override
  bool get isLoadingLogout {
    _$isLoadingLogoutAtom.reportRead();
    return super.isLoadingLogout;
  }

  @override
  set isLoadingLogout(bool value) {
    _$isLoadingLogoutAtom.reportWrite(value, super.isLoadingLogout, () {
      super.isLoadingLogout = value;
    });
  }

  final _$_HomePageControllerBaseActionController =
      ActionController(name: '_HomePageControllerBase');

  @override
  void changeIsLoadingLogout(bool status) {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.changeIsLoadingLogout');
    try {
      return super.changeIsLoadingLogout(status);
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadingLogout: ${isLoadingLogout}
    ''';
  }
}
