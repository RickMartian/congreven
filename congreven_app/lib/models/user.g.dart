// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$User on _UserBase, Store {
  final _$nameAtom = Atom(name: '_UserBase.name');

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

  final _$tokenAtom = Atom(name: '_UserBase.token');

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$emailAtom = Atom(name: '_UserBase.email');

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

  final _$cpfAtom = Atom(name: '_UserBase.cpf');

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

  final _$_UserBaseActionController = ActionController(name: '_UserBase');

  @override
  void loggedUser(dynamic userData) {
    final _$actionInfo =
        _$_UserBaseActionController.startAction(name: '_UserBase.loggedUser');
    try {
      return super.loggedUser(userData);
    } finally {
      _$_UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateUser(dynamic userData) {
    final _$actionInfo =
        _$_UserBaseActionController.startAction(name: '_UserBase.updateUser');
    try {
      return super.updateUser(userData);
    } finally {
      _$_UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clean() {
    final _$actionInfo =
        _$_UserBaseActionController.startAction(name: '_UserBase.clean');
    try {
      return super.clean();
    } finally {
      _$_UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
token: ${token},
email: ${email},
cpf: ${cpf}
    ''';
  }
}
