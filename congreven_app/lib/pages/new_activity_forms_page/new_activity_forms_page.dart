import 'package:congreven_app/actions/new_activity_page_actions.dart';
import 'package:congreven_app/components/text_field.dart';
import 'package:congreven_app/pages/new_activity_forms_page/new_activity_forms_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class NewActivityFormsPage extends StatefulWidget {
  @override
  _NewActivityFormsPageState createState() => _NewActivityFormsPageState();
}

class _NewActivityFormsPageState extends State<NewActivityFormsPage> {
  final MaskedTextController _dateController =
      MaskedTextController(mask: "00/00/0000");
  final _nameController = TextEditingController();
  final _periodController = TextEditingController();
  final _startHourController = MaskedTextController(mask: "00:00");
  final _endHourController = MaskedTextController(mask: "00:00");

  void initState() {
    super.initState();
    final newActivityFormsPageController =
        Provider.of<NewActivityFormsPageController>(context, listen: false);
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
    cleanNewActivityState(context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final newActivityFormsPageController =
        Provider.of<NewActivityFormsPageController>(context);
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
                  onChanged: newActivityFormsPageController.changeName,
                  errorText: newActivityFormsPageController.validateName,
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
                  labelText: "Período",
                  onChanged: newActivityFormsPageController.changePeriod,
                  errorText: newActivityFormsPageController.validatePeriod,
                  controller: _periodController,
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
                  onChanged: newActivityFormsPageController.changeDate,
                  errorText: newActivityFormsPageController.validateDate,
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
                  labelText: "Hora inicial",
                  onChanged: newActivityFormsPageController.changeStartHour,
                  errorText: newActivityFormsPageController.validateStartHour,
                  controller: _startHourController,
                );
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            Observer(
              builder: (_) {
                return renderTextField(
                  labelText: "Hora final",
                  onChanged: newActivityFormsPageController.changeEndHour,
                  errorText: newActivityFormsPageController.validateEndHour,
                  controller: _endHourController,
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
