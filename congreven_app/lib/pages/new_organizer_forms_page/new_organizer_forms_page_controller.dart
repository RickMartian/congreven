import 'package:mobx/mobx.dart';
part 'new_organizer_forms_page_controller.g.dart';

class NewOrganizerFormsPageController = _NewOrganizerFormsPageControllerBase
    with _$NewOrganizerFormsPageController;

abstract class _NewOrganizerFormsPageControllerBase with Store {
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

  @observable
  String cnpj;

  @action
  void changeCnpj(String newCnpj) =>
      cnpj = newCnpj.length >= 10 ? newCnpj.substring(0, 18) : newCnpj;

  @observable
  String description;

  @action
  void changeDescription(String newDescription) => description = newDescription;

  @observable
  bool isEditting = false;

  @action
  void changeIsEditting(bool status) {
    isEditting = status;
  }

  @observable
  dynamic organizerToEdit;

  @action
  void changeOrganizerToEdit(dynamic organizer) {
    organizerToEdit = organizer;
  }

  @action
  void clean() {
    name = null;
    cnpj = null;
    description = null;
  }

  @computed
  get organizerToRegister => {
        "name": name,
        "cnpj": cnpj.replaceAll(RegExp(r"[^\s\w]"), ''),
        "description": description,
      };

  String validateDescription() {
    if (description == null || description.isEmpty) {
      return "O campo 'descrição' é obrigatório!";
    }
    return null;
  }

  String validateName() {
    if (name == null || name.isEmpty) {
      return "O campo 'nome' é obrigatório!";
    }
    return null;
  }

  String validateCnpj() {
    if (cnpj == null || cnpj.isEmpty) {
      return "O campo 'cnpj' é obrigatório!";
    }
    return null;
  }

  @computed
  get isValid =>
      validateName() == null &&
      validateCnpj() == null &&
      validateDescription() == null;
}
