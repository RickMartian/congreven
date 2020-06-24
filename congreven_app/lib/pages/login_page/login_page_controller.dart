import 'package:mobx/mobx.dart';
part 'login_page_controller.g.dart';

class LoginPageController = _LoginPageControllerBase with _$LoginPageController;

abstract class _LoginPageControllerBase with Store {
  @observable
  String email;

  @action
  void changeEmail(String newEmail) {
    print("EMAIL ALTERADO -> $newEmail");
    email = newEmail;
  }

  @observable
  String password;

  @action
  void changePassword(String newPassword) => password = newPassword;

  String validateEmail() {
    print("CAIU NA VALIDAÇÃO DO EMAIL!");
    if (email == null || email.isEmpty) {
      return "O campo 'email' é obrigatório!";
    }
    return null;
  }

  String validatePassword() {
    if (password == null || password.isEmpty) {
      return "O campo 'senha' é obrigatório!";
    }
    return null;
  }

  @action
  void clean() {
    email = null;
    password = null;
  }

  @computed
  get userToLogin => {"email": email, "password": password};
}
