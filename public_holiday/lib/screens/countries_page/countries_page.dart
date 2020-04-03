import 'package:flutter/material.dart';
import 'package:public_holiday/screens/countries_page/alphabet_scroll_view.dart';
import 'package:public_holiday/screens/countries_page/country_list_tile.dart';

class CountriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
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
        ),
        AlphabetScrollView(),
      ],
    );
  }
}
