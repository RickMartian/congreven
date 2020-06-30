// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$News on _NewsBase, Store {
  final _$newsAtom = Atom(name: '_NewsBase.news');

  @override
  ObservableList<dynamic> get news {
    _$newsAtom.reportRead();
    return super.news;
  }

  @override
  set news(ObservableList<dynamic> value) {
    _$newsAtom.reportWrite(value, super.news, () {
      super.news = value;
    });
  }

  final _$isFetchingNewsAtom = Atom(name: '_NewsBase.isFetchingNews');

  @override
  bool get isFetchingNews {
    _$isFetchingNewsAtom.reportRead();
    return super.isFetchingNews;
  }

  @override
  set isFetchingNews(bool value) {
    _$isFetchingNewsAtom.reportWrite(value, super.isFetchingNews, () {
      super.isFetchingNews = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_NewsBase.errorMessage');

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

  final _$_NewsBaseActionController = ActionController(name: '_NewsBase');

  @override
  void updateNews(List<dynamic> newNews) {
    final _$actionInfo =
        _$_NewsBaseActionController.startAction(name: '_NewsBase.updateNews');
    try {
      return super.updateNews(newNews);
    } finally {
      _$_NewsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNews(dynamic newNews) {
    final _$actionInfo =
        _$_NewsBaseActionController.startAction(name: '_NewsBase.addNews');
    try {
      return super.addNews(newNews);
    } finally {
      _$_NewsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeNews(dynamic newNews) {
    final _$actionInfo =
        _$_NewsBaseActionController.startAction(name: '_NewsBase.removeNews');
    try {
      return super.removeNews(newNews);
    } finally {
      _$_NewsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsFetchingNews(bool status) {
    final _$actionInfo = _$_NewsBaseActionController.startAction(
        name: '_NewsBase.changeIsFetchingNews');
    try {
      return super.changeIsFetchingNews(status);
    } finally {
      _$_NewsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFetchingNewsErrorMessage(String message) {
    final _$actionInfo = _$_NewsBaseActionController.startAction(
        name: '_NewsBase.changeFetchingNewsErrorMessage');
    try {
      return super.changeFetchingNewsErrorMessage(message);
    } finally {
      _$_NewsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clean() {
    final _$actionInfo =
        _$_NewsBaseActionController.startAction(name: '_NewsBase.clean');
    try {
      return super.clean();
    } finally {
      _$_NewsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
news: ${news},
isFetchingNews: ${isFetchingNews},
errorMessage: ${errorMessage}
    ''';
  }
}
