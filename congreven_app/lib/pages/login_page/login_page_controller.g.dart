// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginPageController on _LoginPageControllerBase, Store {
  Computed<dynamic> _$userToLoginComputed;

  @override
  dynamic get userToLogin =>
      (_$userToLoginComputed ??= Computed<dynamic>(() => super.userToLogin,
              name: '_LoginPageControllerBase.userToLogin'))
          .value;
  Computed<dynamic> _$isValidComputed;

  @override
  dynamic get isValid =>
      (_$isValidComputed ??= Computed<dynamic>(() => super.isValid,
              name: '_LoginPageControllerBase.isValid'))
          .value;

  final _$emailAtom = Atom(name: '_LoginPageControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginPageControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$_LoginPageControllerBaseActionController =
      ActionController(name: '_LoginPageControllerBase');

  @override
  void changeEmail(String newEmail) {
    final _$actionInfo = _$_LoginPageControllerBaseActionController.startAction(
        name: '_LoginPageControllerBase.changeEmail');
    try {
      return super.changeEmail(newEmail);
    } finally {
      _$_LoginPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePassword(String newPassword) {
    final _$actionInfo = _$_LoginPageControllerBaseActionController.startAction(
        name: '_LoginPageControllerBase.changePassword');
    try {
      return super.changePassword(newPassword);
    } finally {
      _$_LoginPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clean() {
    final _$actionInfo = _$_LoginPageControllerBaseActionController.startAction(
        name: '_LoginPageControllerBase.clean');
    try {
      return super.clean();
    } finally {
      _$_LoginPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
userToLogin: ${userToLogin},
isValid: ${isValid}
    ''';
  }
}
