import 'package:flutter/material.dart';

import 'country.dart';

class RecentCountries with ChangeNotifier {
  List<Country> _recentCountries = [];

  void addToRecentCountries(Country country) {

    if(_recentCountries.contains(country)) { _recentCountries.remove(country); }
    else if(_recentCountries.length == 10) { _recentCountries.removeAt(0); }

    _recentCountries.add(country);
    notifyListeners();
  }

  List<Country> get getRecentCountries => [..._recentCountries].reversed.toList();
}
