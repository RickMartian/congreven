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

  @observable
  bool canValidate = false;

  @action
  void changeCanValidate(bool status) {
    canValidate = status;
  }

  String validateEmail() {
    if (canValidate) {
      if (email == null || email.isEmpty) {
        return "O campo 'email' é obrigatório!";
      }
    }
    return null;
  }

  String validatePassword() {
    if (canValidate) {
      if (password == null || password.isEmpty) {
        return "O campo 'senha' é obrigatório!";
      }
    }
    return null;
  }

  String validateName() {
    if (canValidate) {
      if (name == null || name.isEmpty) {
        return "O campo 'nome' é obrigatório!";
      }
    }
    return null;
  }

  String validateCpf() {
    if (canValidate) {
      if (cpf == null || cpf.isEmpty) {
        return "O campo 'cpf' é obrigatório!";
      }
    }
    return null;
  }

  String validateConfirmPassword() {
    if (canValidate) {
      if (confirmPassword == null || confirmPassword.isEmpty) {
        return "O campo 'confirmar senha' é obrigatório!";
      } else if (confirmPassword != password) {
        return "As senhas não coincidem!";
      }
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
    canValidate = false;
  }

  @computed
  get userToRegister => {
        "name": name,
        "cpf": cpf != null ? cpf.replaceAll(RegExp(r"[^\s\w]"), '') : "",
        "email": email,
        "password": password
      };

  @computed
  get isValid =>
      validateName() == null &&
      validateCpf() == null &&
      validatePassword() == null &&
      validateConfirmPassword() == null &&
      validateEmail() == null &&
      canValidate;
}
