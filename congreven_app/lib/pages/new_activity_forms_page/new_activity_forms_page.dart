import 'package:congreven_app/actions/new_activity_page_actions.dart';
import 'package:congreven_app/components/text_field.dart';
import 'package:congreven_app/pages/new_activity_forms_page/new_activity_forms_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewActivityFormsPage extends StatefulWidget {
  @override
  _NewActivityFormsPageState createState() => _NewActivityFormsPageState();
}

class _NewActivityFormsPageState extends State<NewActivityFormsPage> {
  DateFormat _dateFormat;
  final MaskedTextController _dateController =
      MaskedTextController(mask: "00/00/0000");
  final _nameController = TextEditingController();
  final _periodController = TextEditingController();
  final _startHourController = MaskedTextController(mask: "00:00");
  final _endHourController = MaskedTextController(mask: "00:00");

  void initState() {
    super.initState();
    initializeDateFormatting();
    _dateFormat = DateFormat("dd/MM/yyyy", 'pt_BR');
    final newActivityFormsPageController =
        Provider.of<NewActivityFormsPageController>(context, listen: false);
    if (newActivityFormsPageController.isEditting &&
        newActivityFormsPageController.activityToEdit != null) {
      final activity = newActivityFormsPageController.activityToEdit;
      _nameController.text = activity["name"];
      _periodController.text = activity["period"];
      _startHourController.text = activity["start_hour"];
      _endHourController.text = activity["end_hour"];
      _dateController.text =
          _dateFormat.format(DateTime.parse(activity["date_activity"]));
      newActivityFormsPageController.changeDate(
          _dateFormat.format(DateTime.parse(activity["date_activity"])));
      newActivityFormsPageController.changeName(activity["name"]);
      newActivityFormsPageController.changePeriod(activity["period"]);
      newActivityFormsPageController.changeStartHour(activity["start_hour"]);
      newActivityFormsPageController.changeEndHour(activity["end_hour"]);
    }
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
