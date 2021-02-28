import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:public_holiday/screens/countries_page/countries_page.dart';

class HomePageModel with ChangeNotifier {


  Widget Function() _buildBody = () => CountriesPage();
  String _appBarTitle = "Public Holiday.";
  String _activeTitle = "Public Holiday.";



  void updateBodyBuild(Widget Function() body, String appBarTitle, String activeTitle) {
    this._buildBody = body;
    this._appBarTitle = appBarTitle;
    this._activeTitle = activeTitle;
    notifyListeners();
  }

  Widget Function() get getBuildBodyFunc => this._buildBody;

  String get getAppBarTitle => this._appBarTitle;

  String get getActiveTitle => this._activeTitle;
}