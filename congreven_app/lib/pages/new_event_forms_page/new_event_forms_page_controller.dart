import 'package:mobx/mobx.dart';
part 'new_event_forms_page_controller.g.dart';

class NewEventFormsPageController = _NewEventFormsPageControllerBase
    with _$NewEventFormsPageController;

abstract class _NewEventFormsPageControllerBase with Store {
  @observable
  bool hasSubmitted = false;

  @action
  void changeHasSubmitted(bool status) {
    hasSubmitted = status;
  }

  @observable
  String name;

  @action
  void changeName(String newName) => name = newName;

  @observable
  String address;

  @action
  void changeAddress(String newAddress) => address = newAddress;

  @observable
  String startDate;

  @action
  void changeStartDate(String newStartDate) => startDate = newStartDate;

  @observable
  String endDate;

  @action
  void changeEndDate(String newEndDate) => endDate = newEndDate;

  @observable
  String description;

  @action
  void changeDescription(String newDescription) => description = newDescription;

  @observable
  String ownerDescription;

  @action
  void changeOwnerDescription(String newOwnerDescription) =>
      ownerDescription = newOwnerDescription;

  @observable
  bool isOwner = true;

  @action
  void changeIsOwner(bool status) {
    isOwner = status;
  }

  @observable
  bool isLoadingSomeAction = false;

  @action
  void changeIsLoadingSomeAction(bool status) {
    isLoadingSomeAction = status;
  }

  String validateAddress() {
    if (address == null || address.isEmpty) {
      return "O campo 'endereço' é obrigatório!";
    }
    return null;
  }

  String validateStartDate() {
    if (startDate == null || startDate.isEmpty) {
      return "O campo 'data inicial' é obrigatório!";
    }
    return null;
  }

  String validateName() {
    if (name == null || name.isEmpty) {
      return "O campo 'nome' é obrigatório!";
    }
    return null;
  }

  String validateEndDate() {
    if (endDate == null || endDate.isEmpty) {
      return "O campo 'data final' é obrigatório!";
    }
    return null;
  }

  String validateDescription() {
    if (description == null || description.isEmpty) {
      return "O campo 'descrição do evento' é obrigatório!";
    }
    return null;
  }

  String validateOwnerDescription() {
    if (!isOwner) {
      return null;
    }
    if (ownerDescription == null || ownerDescription.isEmpty) {
      return "O campo 'descrição do proprietário' é obrigatório!";
    }
    return null;
  }

  @action
  void clean() {
    name = null;
    address = null;
    startDate = null;
    endDate = null;
    description = null;
    ownerDescription = null;
  }

  @computed
  get eventToRegister => {
        "name": name,
        "address": address,
        "start_date": startDate,
        "end_date": endDate,
        "description": description,
        "owner_description": ownerDescription,
      };

  @computed
  get isValid =>
      validateName() == null &&
      validateAddress() == null &&
      validateStartDate() == null &&
      validateEndDate() == null &&
      validateDescription() == null &&
      validateOwnerDescription() == null;
}
