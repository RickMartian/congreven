import 'package:mobx/mobx.dart';
part 'register_page_controller.g.dart';

class RegisterPageController = _RegisterPageControllerBase
    with _$RegisterPageController;

abstract class _RegisterPageControllerBase with Store {
  @observable
  String name;

  @action
  void changeName(String newName) => name = newName;

  @observable
  String cpf;

  @action
  void changeCpf(String newCpf) => cpf = newCpf;

  @observable
  String email;

  @action
  void changeEmail(String newEmail) => email = newEmail;

  @observable
  String password;

  @action
  void changePassword(String newPassword) => password = newPassword;

  @observable
  String confirmPassword;

  @action
  void changeConfirmPassword(String newConfirmPassword) =>
      confirmPassword = newConfirmPassword;

  String validateEmail() {
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

  String validateName() {
    if (name == null || name.isEmpty) {
      return "O campo 'nome' é obrigatório!";
    }
    return null;
  }

  String validateCpf() {
    if (cpf == null || cpf.isEmpty) {
      return "O campo 'cpf' é obrigatório!";
    }
    return null;
  }

  String validateConfirmPassword() {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "O campo 'confirmar senha' é obrigatório!";
    } else if (confirmPassword != password) {
      return "As senhas não coincidem!";
    }
    return null;
  }

  @action
  void clean() {
    name = null;
    cpf = null;
    email = null;
    password = null;
    confirmPassword = null;
  }
}
