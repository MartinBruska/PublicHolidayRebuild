import 'package:flutter/material.dart';
import 'package:public_holiday/screens/countries_page/country_list_tile.dart';

class CountriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CountryListTile(
          countryFlagImage: AssetImage(
            "assets/images/turkey-flag.jpg",
          ),
          countryName: "Turkey",
        ),
        CountryListTile(
          countryFlagImage: AssetImage(
            "assets/images/turkey-flag.jpg",
          ),
          countryName: "Turkey",
        ),
      ],
    );
  }
}
