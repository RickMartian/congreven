import 'package:congreven_app/actions/guest_speaker_page_actions.dart';
import 'package:congreven_app/models/guest_speakers.dart';
import 'package:congreven_app/pages/activity_details_page/activity_details_page_controller.dart';
import 'package:congreven_app/pages/guest_speaker_page/guest_speaker_page_controller.dart';
import 'package:congreven_app/utils/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class GuestSpeakerPage extends StatefulWidget {
  @override
  _GuestSpeakerPageState createState() => _GuestSpeakerPageState();
}

class _GuestSpeakerPageState extends State<GuestSpeakerPage> {
  final Debouncer _searchDebouncer = Debouncer(
    delay: Duration(milliseconds: 500),
  );
  String _search = "";

  DateFormat _dateFormat;

  void initState() {
    super.initState();
    initializeDateFormatting();
    _dateFormat = DateFormat("dd/MM/yyyy", 'pt_BR');
    final guestSpeakerPageController =
        Provider.of<GuestSpeakerPageController>(context, listen: false);
    final activityDetailsPageController =
        Provider.of<ActivityDetailsPageController>(context, listen: false);
    if (activityDetailsPageController.activityToUse != null) {
      final guestSpeakers =
          activityDetailsPageController.activityToUse["guestSpeakers"];
      if (guestSpeakers.isNotEmpty) {
        guestSpeakers.forEach((element) {
          guestSpeakerPageController.addSelectedGuestSpeaker(element);
        });
      }
    }
  }

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

  bool verifySelectedOrganizer(dynamic guestSpeaker, selectedGuestSpeakers) {
    bool flag = false;
    if (selectedGuestSpeakers.length > 0) {
      selectedGuestSpeakers.forEach((element) {
        if (element["rg"] == guestSpeaker["rg"]) {
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

  Widget _itemBuilder(
      BuildContext context,
      int index,
      double deviceHeight,
      double deviceWidth,
      List<dynamic> guestSpeakers,
      List<dynamic> selectedGuestSpeakers) {
    if (guestSpeakers.length > 0) {
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
                      "${guestSpeakers[index]["name"]}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    _renderLine(
                      "RG",
                      guestSpeakers[index]["rg"],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    _renderLine(
                      "Escolaridade",
                      guestSpeakers[index]["scholarity"],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    _renderLine(
                      "Data de aniversário",
                      _dateFormat.format(
                          DateTime.tryParse(guestSpeakers[index]["bdate"]) ==
                                  null
                              ? ""
                              : DateTime.parse(guestSpeakers[index]["bdate"])),
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
                                    guestSpeakers[index],
                                    selectedGuestSpeakers)) {
                                  selectGuestSpeaker(
                                      context, guestSpeakers[index]);
                                }
                              },
                              child: Container(
                                child: _renderSelectButton(guestSpeakers[index],
                                    selectedGuestSpeakers),
                              ),
                              color: verifySelectedOrganizer(
                                      guestSpeakers[index],
                                      selectedGuestSpeakers)
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
                                    guestSpeakers[index], selectedGuestSpeakers)
                                ? Expanded(
                                    child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      onPressed: () {
                                        if (verifySelectedOrganizer(
                                            guestSpeakers[index],
                                            selectedGuestSpeakers)) {
                                          removeSelectedGuestSpeaker(
                                              context, guestSpeakers[index]);
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
                          return Expanded(
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              onPressed: () {},
                              child: Container(
                                child: _renderEditButton(guestSpeakers[index]),
                              ),
                              color: verifySelectedOrganizer(
                                      guestSpeakers[index],
                                      selectedGuestSpeakers)
                                  ? Colors.grey
                                  : Colors.green[600],
                            ),
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
    } else
      return Container(width: 0.0, height: 0.0);
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
    final guestSpeakerModel = Provider.of<GuestSpeakers>(context);
    final guestSpeakerPageController =
        Provider.of<GuestSpeakerPageController>(context);
    final activityDetailsPageController =
        Provider.of<ActivityDetailsPageController>(context);
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
                return !guestSpeakerPageController.isFetchingGuestSpeaker
                    ? _filterOrganizerByName(guestSpeakerModel.guestSpeakers)
                                .length >
                            0
                        ? ListView.builder(
                            itemBuilder: (_, int index) => _itemBuilder(
                              context,
                              index,
                              deviceHeight,
                              deviceWidth,
                              _filterOrganizerByName(
                                  guestSpeakerModel.guestSpeakers),
                              guestSpeakerPageController.selectedGuestSpeakers,
                            ),
                            itemCount: _filterOrganizerByName(
                                    guestSpeakerModel.guestSpeakers)
                                .length,
                          )
                        : Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text("Não há palestrante."),
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
