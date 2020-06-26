import 'package:congreven_app/components/text_field.dart';
import 'package:congreven_app/pages/new_event_forms_page/new_event_forms_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class NewEventFormsPage extends StatefulWidget {
  @override
  _NewEventFormsPageState createState() => _NewEventFormsPageState();
}

class _NewEventFormsPageState extends State<NewEventFormsPage> {
  final MaskedTextController _startDateController =
      MaskedTextController(mask: "00/00/0000");
  final MaskedTextController _endDateController =
      MaskedTextController(mask: "00/00/0000");

  _handleIsOwner(newEventFormsPageController) {
    if (newEventFormsPageController.isOwner) {
      return renderTextField(
        labelText: "Descrição do proprietário",
        onChanged: newEventFormsPageController.changeOwnerDescription,
        errorText: newEventFormsPageController.validateOwnerDescription,
      );
    } else {
      return FlatButton(
        color: Theme.of(context).primaryColorLight,
        onPressed: () {},
        child: Container(
          child: Text("Selecionar o organizador"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final newEventFormsPageController =
        Provider.of<NewEventFormsPageController>(context);
    _startDateController.text = newEventFormsPageController.startDate;
    _endDateController.text = newEventFormsPageController.endDate;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.only(top: 10.0),
      child: ListView(
        children: <Widget>[
          Observer(
            builder: (_) {
              return renderTextField(
                labelText: "Nome",
                onChanged: newEventFormsPageController.changeName,
                errorText: newEventFormsPageController.validateName,
              );
            },
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Observer(builder: (_) {
                return Checkbox(
                  activeColor: Theme.of(context).primaryColorLight,
                  onChanged: (bool value) {
                    print("value -> $value");
                    newEventFormsPageController.changeIsOwner(value);
                  },
                  value: newEventFormsPageController.isOwner,
                );
              }),
              Text(
                "Eu sou o proprietário do evento",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          Observer(
            builder: (_) {
              return _handleIsOwner(newEventFormsPageController);
            },
          ),
          SizedBox(
            height: 15.0,
          ),
          Observer(
            builder: (_) {
              return renderTextField(
                labelText: "Endereço",
                onChanged: newEventFormsPageController.changeAddress,
                errorText: newEventFormsPageController.validateAddress,
              );
            },
          ),
          SizedBox(
            height: 15.0,
          ),
          Observer(
            builder: (_) {
              return renderTextField(
                  labelText: "Data inicial",
                  onChanged: newEventFormsPageController.changeStartDate,
                  errorText: newEventFormsPageController.validateStartDate,
                  controller: _startDateController);
            },
          ),
          SizedBox(
            height: 15.0,
          ),
          Observer(
            builder: (_) {
              return renderTextField(
                  labelText: "Data final",
                  onChanged: newEventFormsPageController.changeEndDate,
                  errorText: newEventFormsPageController.validateEndDate,
                  controller: _endDateController);
            },
          ),
          SizedBox(
            height: 15.0,
          ),
          Observer(
            builder: (_) {
              return renderTextField(
                labelText: "Descrição do evento",
                onChanged: newEventFormsPageController.changeDescription,
                errorText: newEventFormsPageController.validateDescription,
              );
            },
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}
