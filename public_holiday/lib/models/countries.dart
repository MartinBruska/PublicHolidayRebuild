import 'package:faker/faker.dart';

import 'country.dart';

class Countries {
  List<Country> countriesList = [];

  List<Country> generateDummyData(int numberOfCountries) {
    for (var i = 0; i < numberOfCountries; i++) {
      this.countriesList.add(Country(
          id: i.toString(),
          name: faker.person.firstName(),
          flagImageName: "turkey-flag"));
      this
          .countriesList
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    }
    return [...countriesList];
  }

  List<Country> get getCountriesLsit{
    return [...countriesList];
  }

 

}
