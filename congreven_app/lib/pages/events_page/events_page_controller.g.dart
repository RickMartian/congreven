// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventsPageController on _EventsPageControllerBase, Store {
  final _$isFetchingEventsAtom =
      Atom(name: '_EventsPageControllerBase.isFetchingEvents');

  @override
  bool get isFetchingEvents {
    _$isFetchingEventsAtom.reportRead();
    return super.isFetchingEvents;
  }

  @override
  set isFetchingEvents(bool value) {
    _$isFetchingEventsAtom.reportWrite(value, super.isFetchingEvents, () {
      super.isFetchingEvents = value;
    });
  }

  final _$_EventsPageControllerBaseActionController =
      ActionController(name: '_EventsPageControllerBase');

  @override
  void changeIsFetchingEvents(bool status) {
    final _$actionInfo = _$_EventsPageControllerBaseActionController
        .startAction(name: '_EventsPageControllerBase.changeIsFetchingEvents');
    try {
      return super.changeIsFetchingEvents(status);
    } finally {
      _$_EventsPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFetchingEvents: ${isFetchingEvents}
    ''';
  }
}
