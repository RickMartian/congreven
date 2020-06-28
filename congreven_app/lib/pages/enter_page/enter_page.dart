import 'package:congreven_app/actions/login_page_actions.dart';
import 'package:congreven_app/actions/register_page_actions.dart';
import 'package:congreven_app/interfaces/local_storage_interface.dart';
import 'package:congreven_app/pages/enter_page/enter_page_controller.dart';
import 'package:congreven_app/pages/login_page/login_page.dart';
import 'package:congreven_app/pages/login_page/login_page_controller.dart';
import 'package:congreven_app/pages/register_page/register_page.dart';
import 'package:congreven_app/pages/register_page/register_page_controller.dart';
import 'package:congreven_app/services/shared_local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class EnterPages {
  static const login = 0;
  static const register = 1;
}

class EnterPage extends StatefulWidget {
  @override
  _EnterPageState createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  int _selectedPage = EnterPages.login;
  ILocalStorage storage = SharedLocalStorageService();

  void initState() {
    super.initState();
    storage.get("userData").then((userData) {
      verifyIsLogged(userData, context);
    });
  }

  _handleButtonClicked(int pageSelected) {
    setState(() {
      _selectedPage = pageSelected;
    });
  }

  _renderSelectedPage() {
    switch (_selectedPage) {
      case EnterPages.login:
        return LoginPage();
      case EnterPages.register:
        return RegisterPage();
    }
  }

  _handleSubmittedData() {
    switch (_selectedPage) {
      case EnterPages.login:
        loginUser(context);
        break;
      case EnterPages.register:
        registerUser(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    final loginPageController = Provider.of<LoginPageController>(context);
    final registerPageController = Provider.of<RegisterPageController>(context);
    final enterPageController = Provider.of<EnterPageController>(context);
    return Observer(
      builder: (_) {
        return !enterPageController.isLoadingApp
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).backgroundColor,
                  elevation: 0.0,
                  leading: Builder(
                    builder: (context) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
                        child: Center(
                          child: Icon(
                            Icons.person_outline,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      );
                    },
                  ),
                  actions: <Widget>[
                    InkWell(
                      onTap: () {
                        registerPageController.clean();
                        _handleButtonClicked(EnterPages.login);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(0.0, 12.0, 20.0, 12.0),
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: _selectedPage == EnterPages.login
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width:
                                  _selectedPage == EnterPages.login ? 2.0 : 0.0,
                              color: _selectedPage == EnterPages.login
                                  ? Colors.black
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        loginPageController.clean();
                        _handleButtonClicked(EnterPages.register);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(0.0, 12.0, 20.0, 12.0),
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: _selectedPage == EnterPages.register
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: _selectedPage == EnterPages.register
                                  ? 2.0
                                  : 0.0,
                              color: _selectedPage == EnterPages.register
                                  ? Colors.black
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                body: Container(
                  color: Theme.of(context).backgroundColor,
                  child: Container(
                      margin: EdgeInsets.only(top: _deviceHeight / 6),
                      child: _renderSelectedPage()),
                ),
                bottomNavigationBar: BottomAppBar(
                  color: Colors.grey[300],
                  child: Container(
                    height: _deviceHeight / 11,
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endDocked,
                floatingActionButton: Observer(builder: (_) {
                  final isLoading = enterPageController.isLoadingEnterButton;
                  final isValid = _selectedPage == EnterPages.register
                      ? registerPageController.isValid
                      : loginPageController.isValid;
                  return FloatingActionButton(
                    onPressed: () {
                      if (!isLoading && isValid) {
                        enterPageController.changeIsLoadingEnterButton(true);
                        _handleSubmittedData();
                      }
                    },
                    backgroundColor: Theme.of(context).primaryColorLight,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: !isLoading
                        ? Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        : CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                  );
                }),
              )
            : WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                  body: Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColorLight,
                        ),
                      ),
                    ),
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
              );
      },
    );
  }
}
