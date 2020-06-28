import 'package:mobx/mobx.dart';
part 'my_account_page_controller.g.dart';

class MyAccountPageController = _MyAccountPageControllerBase
    with _$MyAccountPageController;

abstract class _MyAccountPageControllerBase with Store {
  @observable
  bool isLoadingSomeAction = false;

  @action
  void changeIsLoadingSomeAction(bool status) {
    isLoadingSomeAction = status;
  }

  @observable
  String name;

  @action
  void changeName(String newName) => name = newName;

  @computed
  get isValid => validateName() == null;

  @computed
  get userToUpdate => {
        "name": name,
      };

  String validateName() {
    if (name == null || name.isEmpty) {
      return "O campo 'nome' é obrigatório!";
    }
    return null;
  }
}
