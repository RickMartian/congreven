import 'package:mobx/mobx.dart';
part 'login_page_controller.g.dart';

class LoginPageController = _LoginPageControllerBase with _$LoginPageController;

abstract class _LoginPageControllerBase with Store {
  @observable
  String email;

  @action
  void changeEmail(String newEmail) {
    email = newEmail;
  }

  @observable
  String password;

  @action
  void changePassword(String newPassword) => password = newPassword;

  @observable
  bool canValidate = false;

  @action
  void changeCanValidate(bool status) {
    canValidate = status;
  }

  String validateEmail() {
    if ((email == null || email.isEmpty) && canValidate) {
      return "O campo 'email' é obrigatório!";
    }
    return null;
  }

  String validatePassword() {
    if ((password == null || password.isEmpty) && canValidate) {
      return "O campo 'senha' é obrigatório!";
    }
    return null;
  }

  @action
  void clean() {
    email = null;
    password = null;
    canValidate = false;
  }

  @computed
  get userToLogin => {"email": email, "password": password};

  @computed
  get isValid =>
      validateEmail() == null && validatePassword() == null && canValidate;
}
