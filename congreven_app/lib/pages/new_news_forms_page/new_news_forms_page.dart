import 'package:congreven_app/actions/new_news_page_actions.dart';
import 'package:congreven_app/components/text_field.dart';
import 'package:congreven_app/pages/new_news_forms_page/new_news_forms_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class NewNewsFormsPage extends StatefulWidget {
  @override
  _NewNewsFormsPageState createState() => _NewNewsFormsPageState();
}

class _NewNewsFormsPageState extends State<NewNewsFormsPage> {
  final MaskedTextController _dateController =
      MaskedTextController(mask: "00/00/0000");
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  void initState() {
    super.initState();
    final newNewsFormsPageController =
        Provider.of<NewNewsFormsPageController>(context, listen: false);
    // if (myEventsEditPageController.eventToUse != null) {
    //   if (eventToUse == null) {
    //     _startDateController.text = newEventFormsPageController.startDate;
    //     _endDateController.text = newEventFormsPageController.endDate;
    //   }
    //   if (eventToUse != null) {
    //     _nameController.text = eventToUse["name"];
    //     _addressController.text = eventToUse["address"];
    //     _startDateController.text = eventToUse["start_date_formatted"];
    //     _endDateController.text = eventToUse["end_date_formatted"];
    //     _descriptionController.text = eventToUse["description"];
    //     _ownerDescriptionController.text = eventToUse["owner_description"];
    //     newEventFormsPageController.changeName(eventToUse["name"]);
    //     newEventFormsPageController.changeAddress(eventToUse["address"]);
    //     newEventFormsPageController
    //         .changeDescription(eventToUse["description"]);
    //     newEventFormsPageController
    //         .changeOwnerDescription(eventToUse["owner_description"]);
    //     newEventFormsPageController
    //         .changeStartDate(eventToUse["start_date_formatted"]);
    //     newEventFormsPageController
    //         .changeEndDate(eventToUse["end_date_formatted"]);
    //     if (eventToUse["owner_description"] == null || eventToUse.isEmpty) {
    //       newEventFormsPageController.changeIsOwner(false);
    //       if (organizersToUse.length > 0) {
    //         organizersToUse.forEach((element) =>
    //             newEventFormsPageController.addOrganizerToEvent(element));
    //       }
    //     }
    //   }
    // }
  }

  Future<bool> _onWillPop() async {
    cleanNewNewsState(context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final newNewsFormsPageController =
        Provider.of<NewNewsFormsPageController>(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        padding: EdgeInsets.only(top: 10.0),
        child: ListView(
          children: <Widget>[
            Observer(
              builder: (_) {
                return renderTextField(
                  labelText: "Nome",
                  onChanged: newNewsFormsPageController.changeName,
                  errorText: newNewsFormsPageController.validateName,
                  controller: _nameController,
                );
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            Observer(
              builder: (_) {
                return renderTextField(
                  labelText: "Data",
                  onChanged: newNewsFormsPageController.changeDate,
                  errorText: newNewsFormsPageController.validateDate,
                  controller: _dateController,
                );
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            Observer(
              builder: (_) {
                return renderTextField(
                  labelText: "Descrição",
                  onChanged: newNewsFormsPageController.changeDescription,
                  errorText: newNewsFormsPageController.validateDescription,
                  controller: _descriptionController,
                );
              },
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
