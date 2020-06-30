// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_speaker_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GuestSpeakerPageController on _GuestSpeakerPageControllerBase, Store {
  final _$isFetchingGuestSpeakerAtom =
      Atom(name: '_GuestSpeakerPageControllerBase.isFetchingGuestSpeaker');

  @override
  bool get isFetchingGuestSpeaker {
    _$isFetchingGuestSpeakerAtom.reportRead();
    return super.isFetchingGuestSpeaker;
  }

  @override
  set isFetchingGuestSpeaker(bool value) {
    _$isFetchingGuestSpeakerAtom
        .reportWrite(value, super.isFetchingGuestSpeaker, () {
      super.isFetchingGuestSpeaker = value;
    });
  }

  final _$selectedGuestSpeakersAtom =
      Atom(name: '_GuestSpeakerPageControllerBase.selectedGuestSpeakers');

  @override
  ObservableList<dynamic> get selectedGuestSpeakers {
    _$selectedGuestSpeakersAtom.reportRead();
    return super.selectedGuestSpeakers;
  }

  @override
  set selectedGuestSpeakers(ObservableList<dynamic> value) {
    _$selectedGuestSpeakersAtom.reportWrite(value, super.selectedGuestSpeakers,
        () {
      super.selectedGuestSpeakers = value;
    });
  }

  final _$_GuestSpeakerPageControllerBaseActionController =
      ActionController(name: '_GuestSpeakerPageControllerBase');

  @override
  void changeIsFetchingGuestSpeaker(bool status) {
    final _$actionInfo =
        _$_GuestSpeakerPageControllerBaseActionController.startAction(
            name:
                '_GuestSpeakerPageControllerBase.changeIsFetchingGuestSpeaker');
    try {
      return super.changeIsFetchingGuestSpeaker(status);
    } finally {
      _$_GuestSpeakerPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSelectedGuestSpeaker(dynamic guestSpeakers) {
    final _$actionInfo =
        _$_GuestSpeakerPageControllerBaseActionController.startAction(
            name: '_GuestSpeakerPageControllerBase.updateSelectedGuestSpeaker');
    try {
      return super.updateSelectedGuestSpeaker(guestSpeakers);
    } finally {
      _$_GuestSpeakerPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSelectedGuestSpeaker(dynamic guestSpeaker) {
    final _$actionInfo =
        _$_GuestSpeakerPageControllerBaseActionController.startAction(
            name: '_GuestSpeakerPageControllerBase.addSelectedGuestSpeaker');
    try {
      return super.addSelectedGuestSpeaker(guestSpeaker);
    } finally {
      _$_GuestSpeakerPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSelectedGuestSpeaker(dynamic guestSpeaker) {
    final _$actionInfo =
        _$_GuestSpeakerPageControllerBaseActionController.startAction(
            name: '_GuestSpeakerPageControllerBase.removeSelectedGuestSpeaker');
    try {
      return super.removeSelectedGuestSpeaker(guestSpeaker);
    } finally {
      _$_GuestSpeakerPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFetchingGuestSpeaker: ${isFetchingGuestSpeaker},
selectedGuestSpeakers: ${selectedGuestSpeakers}
    ''';
  }
}
