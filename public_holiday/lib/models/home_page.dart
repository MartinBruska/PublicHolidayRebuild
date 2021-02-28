import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:public_holiday/screens/countries_page/countries_page.dart';
import 'package:public_holiday/strings.dart';

class HomePageModel with ChangeNotifier {

  Widget Function() _buildBody = () => CountriesPage();
  String _appBarTitle = Strings.APP_BAR_TITLE;
  String _activeBtnTitle = Strings.APP_BAR_TITLE;

  void updateBodyBuild(Widget Function() body, String appBarTitle, String activeBtnTitle) {
    this._buildBody = body;
    this._appBarTitle = appBarTitle;
    this._activeBtnTitle = activeBtnTitle;
    notifyListeners();
  }

  Widget Function() get getBuildBodyFunc => this._buildBody;

  String get getAppBarTitle => this._appBarTitle;

  String get getActiveBtnTitle => this._activeBtnTitle;
}