// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizer_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrganizerPageController on _OrganizerPageControllerBase, Store {
  final _$isFetchingOrganizerAtom =
      Atom(name: '_OrganizerPageControllerBase.isFetchingOrganizer');

  @override
  bool get isFetchingOrganizer {
    _$isFetchingOrganizerAtom.reportRead();
    return super.isFetchingOrganizer;
  }

  @override
  set isFetchingOrganizer(bool value) {
    _$isFetchingOrganizerAtom.reportWrite(value, super.isFetchingOrganizer, () {
      super.isFetchingOrganizer = value;
    });
  }

  final _$_OrganizerPageControllerBaseActionController =
      ActionController(name: '_OrganizerPageControllerBase');

  @override
  void changeIsFetchingOrganizer(bool status) {
    final _$actionInfo =
        _$_OrganizerPageControllerBaseActionController.startAction(
            name: '_OrganizerPageControllerBase.changeIsFetchingOrganizer');
    try {
      return super.changeIsFetchingOrganizer(status);
    } finally {
      _$_OrganizerPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFetchingOrganizer: ${isFetchingOrganizer}
    ''';
  }
}
