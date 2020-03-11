import 'package:flutter/material.dart';
import 'package:public_holiday/screens/countries_page/country_list_tile.dart';

class CountriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CountryListTile(
        countryFlagImage: Image(
          image: AssetImage("assets/images/turkey-flag.jpg"),
        ),
        countryName: "Turkey",
      ),
    );
  }
}
