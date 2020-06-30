import 'package:mobx/mobx.dart';
part 'news.g.dart';

class News = _NewsBase with _$News;

abstract class _NewsBase with Store {
  @observable
  ObservableList<dynamic> news = ObservableList<dynamic>().asObservable();

  @action
  void updateNews(List<dynamic> newNews) {
    ObservableList<dynamic> temp = ObservableList<dynamic>();
    temp.addAll(newNews);
    news = temp;
  }

  @action
  void addNews(dynamic newNews) {
    news.add(newNews);
  }

  @action
  void removeNews(dynamic newNews) {
    news.removeWhere((element) => element["id"] == newNews["id"]);
  }

  @observable
  bool isFetchingNews = false;

  @action
  void changeIsFetchingNews(bool status) {
    isFetchingNews = status;
  }

  @observable
  String errorMessage = "";

  @action
  void changeFetchingNewsErrorMessage(String message) {
    errorMessage = message;
  }

  @action
  void clean() {
    news = ObservableList<dynamic>().asObservable();
    isFetchingNews = false;
    errorMessage = "";
  }
}
