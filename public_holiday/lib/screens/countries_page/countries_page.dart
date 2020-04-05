import 'package:flutter/material.dart';
import 'dart:async';

import 'package:public_holiday/screens/countries_page/alphabet_scroll_view.dart';
import 'package:public_holiday/screens/countries_page/country_list_tile.dart';

class CountriesPage extends StatefulWidget {
  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  Timer _debounce;
  bool _visible = false;
  String chosenLetter = "";

  _showChosenLetter(String letter, bool active) {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _visible = false;
      });
    });
    setState(() {
      _visible = true;
      chosenLetter = letter.toUpperCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                CountryListTile(
                  flagImageName: "turkey-flag",
                  countryName: "Turkey",
                ),
                CountryListTile(
                  flagImageName: "turkey-flag",
                  countryName: "Turkey",
                ),
              ],
            ),
            AlphabetScrollView(parentAction: _showChosenLetter),
          ],
        ),
        IgnorePointer(
          child: AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.black54,
                  child: Center(
                    child: Text(
                      chosenLetter,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
