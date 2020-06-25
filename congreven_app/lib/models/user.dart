import 'package:mobx/mobx.dart';
part 'user.g.dart';

class User = _UserBase with _$User;

abstract class _UserBase with Store {
  @observable
  String name;

  @observable
  String token;

  @observable
  String email;

  @observable
  String cpf;

  @action
  void loggedUser(userData) {
    name = userData["user"]["name"];
    token = userData["token"];
    email = userData["user"]["email"];
    cpf = userData["user"]["cpf"];
  }

  @action
  void clean() {
    name = null;
    token = null;
    email = null;
    cpf = null;
  }
}
