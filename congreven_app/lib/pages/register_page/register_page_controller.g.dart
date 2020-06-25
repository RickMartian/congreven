// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterPageController on _RegisterPageControllerBase, Store {
  Computed<dynamic> _$userToRegisterComputed;

  @override
  dynamic get userToRegister => (_$userToRegisterComputed ??= Computed<dynamic>(
          () => super.userToRegister,
          name: '_RegisterPageControllerBase.userToRegister'))
      .value;
  Computed<dynamic> _$isValidComputed;

  @override
  dynamic get isValid =>
      (_$isValidComputed ??= Computed<dynamic>(() => super.isValid,
              name: '_RegisterPageControllerBase.isValid'))
          .value;

  final _$nameAtom = Atom(name: '_RegisterPageControllerBase.name');

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

  final _$cpfAtom = Atom(name: '_RegisterPageControllerBase.cpf');

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegisterPageControllerBase.email');

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

  final _$passwordAtom = Atom(name: '_RegisterPageControllerBase.password');

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

  final _$confirmPasswordAtom =
      Atom(name: '_RegisterPageControllerBase.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$_RegisterPageControllerBaseActionController =
      ActionController(name: '_RegisterPageControllerBase');

  @override
  void changeName(String newName) {
    final _$actionInfo = _$_RegisterPageControllerBaseActionController
        .startAction(name: '_RegisterPageControllerBase.changeName');
    try {
      return super.changeName(newName);
    } finally {
      _$_RegisterPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCpf(String newCpf) {
    final _$actionInfo = _$_RegisterPageControllerBaseActionController
        .startAction(name: '_RegisterPageControllerBase.changeCpf');
    try {
      return super.changeCpf(newCpf);
    } finally {
      _$_RegisterPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeEmail(String newEmail) {
    final _$actionInfo = _$_RegisterPageControllerBaseActionController
        .startAction(name: '_RegisterPageControllerBase.changeEmail');
    try {
      return super.changeEmail(newEmail);
    } finally {
      _$_RegisterPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePassword(String newPassword) {
    final _$actionInfo = _$_RegisterPageControllerBaseActionController
        .startAction(name: '_RegisterPageControllerBase.changePassword');
    try {
      return super.changePassword(newPassword);
    } finally {
      _$_RegisterPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeConfirmPassword(String newConfirmPassword) {
    final _$actionInfo = _$_RegisterPageControllerBaseActionController
        .startAction(name: '_RegisterPageControllerBase.changeConfirmPassword');
    try {
      return super.changeConfirmPassword(newConfirmPassword);
    } finally {
      _$_RegisterPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clean() {
    final _$actionInfo = _$_RegisterPageControllerBaseActionController
        .startAction(name: '_RegisterPageControllerBase.clean');
    try {
      return super.clean();
    } finally {
      _$_RegisterPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
cpf: ${cpf},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
userToRegister: ${userToRegister},
isValid: ${isValid}
    ''';
  }
}
