// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_speakers.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GuestSpeakers on _GuestSpeakersBase, Store {
  final _$guestSpeakersAtom = Atom(name: '_GuestSpeakersBase.guestSpeakers');

  @override
  ObservableList<dynamic> get guestSpeakers {
    _$guestSpeakersAtom.reportRead();
    return super.guestSpeakers;
  }

  @override
  set guestSpeakers(ObservableList<dynamic> value) {
    _$guestSpeakersAtom.reportWrite(value, super.guestSpeakers, () {
      super.guestSpeakers = value;
    });
  }

  final _$isFetchingGuestSpeakersAtom =
      Atom(name: '_GuestSpeakersBase.isFetchingGuestSpeakers');

  @override
  bool get isFetchingGuestSpeakers {
    _$isFetchingGuestSpeakersAtom.reportRead();
    return super.isFetchingGuestSpeakers;
  }

  @override
  set isFetchingGuestSpeakers(bool value) {
    _$isFetchingGuestSpeakersAtom
        .reportWrite(value, super.isFetchingGuestSpeakers, () {
      super.isFetchingGuestSpeakers = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_GuestSpeakersBase.errorMessage');

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

  final _$_GuestSpeakersBaseActionController =
      ActionController(name: '_GuestSpeakersBase');

  @override
  void updateGuestSpeakers(List<dynamic> newGuestSpeakers) {
    final _$actionInfo = _$_GuestSpeakersBaseActionController.startAction(
        name: '_GuestSpeakersBase.updateGuestSpeakers');
    try {
      return super.updateGuestSpeakers(newGuestSpeakers);
    } finally {
      _$_GuestSpeakersBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addGuestSpeaker(dynamic newGuestSpeaker) {
    final _$actionInfo = _$_GuestSpeakersBaseActionController.startAction(
        name: '_GuestSpeakersBase.addGuestSpeaker');
    try {
      return super.addGuestSpeaker(newGuestSpeaker);
    } finally {
      _$_GuestSpeakersBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeGuestSpeaker(dynamic guestSpeaker) {
    final _$actionInfo = _$_GuestSpeakersBaseActionController.startAction(
        name: '_GuestSpeakersBase.removeGuestSpeaker');
    try {
      return super.removeGuestSpeaker(guestSpeaker);
    } finally {
      _$_GuestSpeakersBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsFetchingGuestSpeakers(bool status) {
    final _$actionInfo = _$_GuestSpeakersBaseActionController.startAction(
        name: '_GuestSpeakersBase.changeIsFetchingGuestSpeakers');
    try {
      return super.changeIsFetchingGuestSpeakers(status);
    } finally {
      _$_GuestSpeakersBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFetchingGuestSpeakersErrorMessage(String message) {
    final _$actionInfo = _$_GuestSpeakersBaseActionController.startAction(
        name: '_GuestSpeakersBase.changeFetchingGuestSpeakersErrorMessage');
    try {
      return super.changeFetchingGuestSpeakersErrorMessage(message);
    } finally {
      _$_GuestSpeakersBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clean() {
    final _$actionInfo = _$_GuestSpeakersBaseActionController.startAction(
        name: '_GuestSpeakersBase.clean');
    try {
      return super.clean();
    } finally {
      _$_GuestSpeakersBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
guestSpeakers: ${guestSpeakers},
isFetchingGuestSpeakers: ${isFetchingGuestSpeakers},
errorMessage: ${errorMessage}
    ''';
  }
}
