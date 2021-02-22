import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';

import 'country.dart';

class Countries with ChangeNotifier {
  List<Country> _countriesList = [];

  Countries() {
    print("new countries build");
    _generateDummyData(100);
  }

  void _generateDummyData(int numberOfCountries) {
    for (var i = 0; i < numberOfCountries; i++) {
      this._countriesList.add(Country(
          id: i.toString(),
          name: faker.person.firstName(),
          flagImageName: "turkey-flag"));
      this._countriesList
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    }
  }

  List<Country> get getCountriesList {
    return [..._countriesList];
  }

  List<Country> get getFavourites {
    return [..._countriesList].where((country) => country.isFavourite).toList();
  }

  int getFirstLetterMatchIndex(String letter) {
    return [..._countriesList].indexWhere((country) => country.name.startsWith(letter.toUpperCase()));
  }

  void toggleFavouriteStatus(Country country) {
    int index = this._countriesList.indexWhere((element) => element.name == country.name);
    this._countriesList[index].isFavourite = !this._countriesList[index].isFavourite;
    notifyListeners();
  }
}
