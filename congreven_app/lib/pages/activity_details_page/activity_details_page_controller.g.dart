// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_details_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ActivityDetailsPageController
    on _ActivityDetailsPageControllerBase, Store {
  final _$activityToUseAtom =
      Atom(name: '_ActivityDetailsPageControllerBase.activityToUse');

  @override
  dynamic get activityToUse {
    _$activityToUseAtom.reportRead();
    return super.activityToUse;
  }

  @override
  set activityToUse(dynamic value) {
    _$activityToUseAtom.reportWrite(value, super.activityToUse, () {
      super.activityToUse = value;
    });
  }

  final _$isFetchingActivityToUseAtom =
      Atom(name: '_ActivityDetailsPageControllerBase.isFetchingActivityToUse');

  @override
  bool get isFetchingActivityToUse {
    _$isFetchingActivityToUseAtom.reportRead();
    return super.isFetchingActivityToUse;
  }

  @override
  set isFetchingActivityToUse(bool value) {
    _$isFetchingActivityToUseAtom
        .reportWrite(value, super.isFetchingActivityToUse, () {
      super.isFetchingActivityToUse = value;
    });
  }

  final _$errorMessageAtom =
      Atom(name: '_ActivityDetailsPageControllerBase.errorMessage');

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

  final _$_ActivityDetailsPageControllerBaseActionController =
      ActionController(name: '_ActivityDetailsPageControllerBase');

  @override
  void changeActivityToUse(dynamic event) {
    final _$actionInfo =
        _$_ActivityDetailsPageControllerBaseActionController.startAction(
            name: '_ActivityDetailsPageControllerBase.changeActivityToUse');
    try {
      return super.changeActivityToUse(event);
    } finally {
      _$_ActivityDetailsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsFetchingActitityToUse(bool status) {
    final _$actionInfo =
        _$_ActivityDetailsPageControllerBaseActionController.startAction(
            name:
                '_ActivityDetailsPageControllerBase.changeIsFetchingActitityToUse');
    try {
      return super.changeIsFetchingActitityToUse(status);
    } finally {
      _$_ActivityDetailsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeFetchingActivitiesErrorMessage(String message) {
    final _$actionInfo =
        _$_ActivityDetailsPageControllerBaseActionController.startAction(
            name:
                '_ActivityDetailsPageControllerBase.changeFetchingActivitiesErrorMessage');
    try {
      return super.changeFetchingActivitiesErrorMessage(message);
    } finally {
      _$_ActivityDetailsPageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activityToUse: ${activityToUse},
isFetchingActivityToUse: ${isFetchingActivityToUse},
errorMessage: ${errorMessage}
    ''';
  }
}
