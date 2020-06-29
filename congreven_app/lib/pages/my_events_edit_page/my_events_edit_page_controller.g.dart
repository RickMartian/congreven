// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_events_edit_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyEventsEditPageController on _MyEventsEditPageControllerBase, Store {
  final _$eventToUseAtom =
      Atom(name: '_MyEventsEditPageControllerBase.eventToUse');

  @override
  dynamic get eventToUse {
    _$eventToUseAtom.reportRead();
    return super.eventToUse;
  }

  @override
  set eventToUse(dynamic value) {
    _$eventToUseAtom.reportWrite(value, super.eventToUse, () {
      super.eventToUse = value;
    });
  }

  final _$_MyEventsEditPageControllerBaseActionController =
      ActionController(name: '_MyEventsEditPageControllerBase');

  @override
  void changeEventToUse(dynamic event) {
    final _$actionInfo = _$_MyEventsEditPageControllerBaseActionController
        .startAction(name: '_MyEventsEditPageControllerBase.changeEventToUse');
    try {
      return super.changeEventToUse(event);
    } finally {
      _$_MyEventsEditPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
eventToUse: ${eventToUse}
    ''';
  }
}
