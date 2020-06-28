// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizer.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Organizer on _OrganizerBase, Store {
  final _$organizersAtom = Atom(name: '_OrganizerBase.organizers');

  @override
  ObservableList<dynamic> get organizers {
    _$organizersAtom.reportRead();
    return super.organizers;
  }

  @override
  set organizers(ObservableList<dynamic> value) {
    _$organizersAtom.reportWrite(value, super.organizers, () {
      super.organizers = value;
    });
  }

  final _$_OrganizerBaseActionController =
      ActionController(name: '_OrganizerBase');

  @override
  void updateOrganizers(List<dynamic> newOrganizers) {
    final _$actionInfo = _$_OrganizerBaseActionController.startAction(
        name: '_OrganizerBase.updateOrganizers');
    try {
      return super.updateOrganizers(newOrganizers);
    } finally {
      _$_OrganizerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addOrganizer(dynamic newOrganizer) {
    final _$actionInfo = _$_OrganizerBaseActionController.startAction(
        name: '_OrganizerBase.addOrganizer');
    try {
      return super.addOrganizer(newOrganizer);
    } finally {
      _$_OrganizerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeOrganizer(dynamic organizer) {
    final _$actionInfo = _$_OrganizerBaseActionController.startAction(
        name: '_OrganizerBase.removeOrganizer');
    try {
      return super.removeOrganizer(organizer);
    } finally {
      _$_OrganizerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
organizers: ${organizers}
    ''';
  }
}
