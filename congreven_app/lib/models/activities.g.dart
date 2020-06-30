// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Activities on _ActivitiesBase, Store {
  final _$activitiesAtom = Atom(name: '_ActivitiesBase.activities');

  @override
  ObservableList<dynamic> get activities {
    _$activitiesAtom.reportRead();
    return super.activities;
  }

  @override
  set activities(ObservableList<dynamic> value) {
    _$activitiesAtom.reportWrite(value, super.activities, () {
      super.activities = value;
    });
  }

  final _$isFetchingActivitiesAtom =
      Atom(name: '_ActivitiesBase.isFetchingActivities');

  @override
  bool get isFetchingActivities {
    _$isFetchingActivitiesAtom.reportRead();
    return super.isFetchingActivities;
  }

  @override
  set isFetchingActivities(bool value) {
    _$isFetchingActivitiesAtom.reportWrite(value, super.isFetchingActivities,
        () {
      super.isFetchingActivities = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_ActivitiesBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$_ActivitiesBaseActionController =
      ActionController(name: '_ActivitiesBase');

  @override
  void updateActivities(List<dynamic> newActivities) {
    final _$actionInfo = _$_ActivitiesBaseActionController.startAction(
        name: '_ActivitiesBase.updateActivities');
    try {
      return super.updateActivities(newActivities);
    } finally {
      _$_ActivitiesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addActivity(dynamic newActivity) {
    final _$actionInfo = _$_ActivitiesBaseActionController.startAction(
        name: '_ActivitiesBase.addActivity');
    try {
      return super.addActivity(newActivity);
    } finally {
      _$_ActivitiesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeActivity(dynamic activity) {
    final _$actionInfo = _$_ActivitiesBaseActionController.startAction(
        name: '_ActivitiesBase.removeActivity');
    try {
      return super.removeActivity(activity);
    } finally {
      _$_ActivitiesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsFetchingActivities(bool status) {
    final _$actionInfo = _$_ActivitiesBaseActionController.startAction(
        name: '_ActivitiesBase.changeIsFetchingActivities');
    try {
      return super.changeIsFetchingActivities(status);
    } finally {
      _$_ActivitiesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFetchingActivitiesErrorMessage(String message) {
    final _$actionInfo = _$_ActivitiesBaseActionController.startAction(
        name: '_ActivitiesBase.changeFetchingActivitiesErrorMessage');
    try {
      return super.changeFetchingActivitiesErrorMessage(message);
    } finally {
      _$_ActivitiesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clean() {
    final _$actionInfo = _$_ActivitiesBaseActionController.startAction(
        name: '_ActivitiesBase.clean');
    try {
      return super.clean();
    } finally {
      _$_ActivitiesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activities: ${activities},
isFetchingActivities: ${isFetchingActivities},
errorMessage: ${errorMessage}
    ''';
  }
}
