import 'package:congreven_app/actions/organizer_page_actions.dart';
import 'package:congreven_app/models/organizer.dart';
import 'package:congreven_app/models/user.dart';
import 'package:congreven_app/pages/new_event_forms_page/new_event_forms_page_controller.dart';
import 'package:congreven_app/pages/new_organizer_forms_page/new_organizer_forms_page_controller.dart';
import 'package:congreven_app/pages/new_organizer_page/new_organizer_page.dart';
import 'package:congreven_app/pages/organizer_page/organizer_page_controller.dart';
import 'package:congreven_app/utils/debouncer.dart';
import 'package:congreven_app/utils/formatCnpj.dart';
import 'package:congreven_app/utils/routeTo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class OrganizerPage extends StatefulWidget {
  @override
  _OrganizerPageState createState() => _OrganizerPageState();
}

class _OrganizerPageState extends State<OrganizerPage> {
  final Debouncer _searchDebouncer = Debouncer(
    delay: Duration(milliseconds: 500),
  );
  String _search = "";

  void _onChanged(String value) {
    _searchDebouncer.run(() {
      setState(() {
        _search = value;
      });
    });
  }

  Widget _renderLine(String title, String value) {
    return Row(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(right: 10.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(
          child: Container(
            child: Text(
              value,
              textAlign: TextAlign.right,
            ),
            alignment: Alignment.bottomRight,
          ),
        )
      ],
    );
  }

  bool verifySelectedOrganizer(dynamic organizer, selectedOrganizers) {
    bool flag = false;
    if (selectedOrganizers.length > 0) {
      selectedOrganizers.forEach((element) {
        if (element["cnpj"] == organizer["cnpj"]) {
          flag = true;
        }
      });
    }
    return flag;
  }

  _renderSelectButton(dynamic organizer, selectedOrganizers) {
    if (verifySelectedOrganizer(organizer, selectedOrganizers)) {
      return Text(
        "SELECIONADO",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.green),
      );
    } else {
      return Text(
        "SELECIONAR",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.green),
      );
    }
  }

  _renderEditButton(dynamic organizer) {
    return Text(
      "EDITAR",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white),
    );
  }

  _verifyOrganizerCpfOwner({String userCpf, String organizerCpfOwner}) {
    if (userCpf == organizerCpfOwner) {
      return true;
    }
    return false;
  }

  Widget _itemBuilder(
      BuildContext context,
      int index,
      double deviceHeight,
      double deviceWidth,
      List<dynamic> organizers,
      List<dynamic> selectedOrganizers) {
    final newOrganizerFormsPageController =
        Provider.of<NewOrganizerFormsPageController>(context, listen: false);
    final userModel = Provider.of<User>(context, listen: false);
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          color: Colors.white,
          elevation: 0,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "${organizers[index]["name"]}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  _renderLine(
                    "CNPJ",
                    formatCnpj(organizers[index]["cnpj"]),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _renderLine(
                    "Descrição",
                    organizers[index]["description"],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Observer(builder: (_) {
                        return Expanded(
                          child: OutlineButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.green)),
                            borderSide: BorderSide(color: Colors.green),
                            onPressed: () {
                              if (!verifySelectedOrganizer(
                                  organizers[index], selectedOrganizers)) {
                                selectOrganizer(context, organizers[index]);
                              }
                            },
                            child: Container(
                              child: _renderSelectButton(
                                  organizers[index], selectedOrganizers),
                            ),
                            color: verifySelectedOrganizer(
                                    organizers[index], selectedOrganizers)
                                ? Colors.green
                                : Colors.blue[200],
                          ),
                        );
                      }),
                      SizedBox(
                        width: 10.0,
                      ),
                      Observer(
                        builder: (_) {
                          return verifySelectedOrganizer(
                                  organizers[index], selectedOrganizers)
                              ? Expanded(
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    onPressed: () {
                                      if (verifySelectedOrganizer(
                                          organizers[index],
                                          selectedOrganizers)) {
                                        removeSelectedOrganizer(
                                            context, organizers[index]);
                                      }
                                    },
                                    child: Container(
                                      child: Text(
                                        "REMOVER",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    color: Colors.red,
                                  ),
                                )
                              : SizedBox(
                                  width: 0.0,
                                );
                        },
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Observer(builder: (_) {
                        return _verifyOrganizerCpfOwner(
                                userCpf: userModel.cpf,
                                organizerCpfOwner: organizers[index]
                                    ["cpf_owner"])
                            ? Expanded(
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  onPressed: () {
                                    if (!verifySelectedOrganizer(
                                        organizers[index],
                                        selectedOrganizers)) {
                                      newOrganizerFormsPageController
                                          .changeIsEditting(true);
                                      newOrganizerFormsPageController
                                          .changeOrganizerToEdit(
                                              organizers[index]);
                                      routeTo(context, NewOrganizerPage());
                                    }
                                  },
                                  child: Container(
                                    child: _renderEditButton(organizers[index]),
                                  ),
                                  color: verifySelectedOrganizer(
                                          organizers[index], selectedOrganizers)
                                      ? Colors.grey
                                      : Colors.green[600],
                                ),
                              )
                            : Container(
                                height: 0.0,
                                width: 0.0,
                              );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.black,
          height: 15,
          thickness: 0.25,
          indent: 0,
          endIndent: 0,
        ),
      ],
    );
  }

  _filterOrganizerByName(List<dynamic> organizer) {
    return organizer.length > 0
        ? organizer
            .where((element) =>
                element["name"].toLowerCase().startsWith(_search.toLowerCase()))
            .toList()
        : organizer;
  }

  @override
  Widget build(BuildContext context) {
    final organizerModel = Provider.of<Organizer>(context);
    final organizerPageController =
        Provider.of<OrganizerPageController>(context);
    final newEventFormsPageController =
        Provider.of<NewEventFormsPageController>(context);
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
            child: TextField(
              onChanged: (value) {
                _onChanged(value);
              },
              decoration: InputDecoration(
                labelText: "Pesquisar",
                labelStyle: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).accentColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Observer(
              builder: (_) {
                return !organizerPageController.isFetchingOrganizer
                    ? _filterOrganizerByName(organizerModel.organizers).length >
                            0
                        ? ListView.builder(
                            itemBuilder: (_, int index) => _itemBuilder(
                              context,
                              index,
                              deviceHeight,
                              deviceWidth,
                              _filterOrganizerByName(organizerModel.organizers),
                              newEventFormsPageController.selectedOrganizers,
                            ),
                            itemCount: _filterOrganizerByName(
                                    organizerModel.organizers)
                                .length,
                          )
                        : Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text("Não há organizador."),
                          )
                    : Container(
                        margin: EdgeInsets.all(10.0),
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColorDark,
                          ),
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
