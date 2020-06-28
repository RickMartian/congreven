// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Events on _EventsBase, Store {
  final _$eventsAtom = Atom(name: '_EventsBase.events');

  @override
  ObservableList<dynamic> get events {
    _$eventsAtom.reportRead();
    return super.events;
  }

  @override
  set events(ObservableList<dynamic> value) {
    _$eventsAtom.reportWrite(value, super.events, () {
      super.events = value;
    });
  }

  final _$_EventsBaseActionController = ActionController(name: '_EventsBase');

  @override
  void updateEvents(List<dynamic> newEvents) {
    final _$actionInfo = _$_EventsBaseActionController.startAction(
        name: '_EventsBase.updateEvents');
    try {
      return super.updateEvents(newEvents);
    } finally {
      _$_EventsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addEvent(dynamic newEvent) {
    final _$actionInfo =
        _$_EventsBaseActionController.startAction(name: '_EventsBase.addEvent');
    try {
      return super.addEvent(newEvent);
    } finally {
      _$_EventsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeEvent(dynamic event) {
    final _$actionInfo = _$_EventsBaseActionController.startAction(
        name: '_EventsBase.removeEvent');
    try {
      return super.removeEvent(event);
    } finally {
      _$_EventsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
events: ${events}
    ''';
  }
}
