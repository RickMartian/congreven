// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_events_edit_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyEventsEditPageController on _MyEventsEditPageControllerBase, Store {
  final _$eventToEditAtom =
      Atom(name: '_MyEventsEditPageControllerBase.eventToEdit');

  @override
  dynamic get eventToEdit {
    _$eventToEditAtom.reportRead();
    return super.eventToEdit;
  }

  @override
  set eventToEdit(dynamic value) {
    _$eventToEditAtom.reportWrite(value, super.eventToEdit, () {
      super.eventToEdit = value;
    });
  }

  final _$_MyEventsEditPageControllerBaseActionController =
      ActionController(name: '_MyEventsEditPageControllerBase');

  @override
  void changeEventToEdit(dynamic event) {
    final _$actionInfo = _$_MyEventsEditPageControllerBaseActionController
        .startAction(name: '_MyEventsEditPageControllerBase.changeEventToEdit');
    try {
      return super.changeEventToEdit(event);
    } finally {
      _$_MyEventsEditPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
eventToEdit: ${eventToEdit}
    ''';
  }
}
