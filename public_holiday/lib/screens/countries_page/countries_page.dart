import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:public_holiday/models/countries.dart';
import 'package:public_holiday/screens/countries_page/alphabet_scroll_view.dart';
import 'package:public_holiday/components/country_list_tile.dart';

class CountriesPage extends StatefulWidget {
  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  Timer _debounce;
  bool _visible = false;
  String chosenLetter = "";
  final ItemScrollController itemScrollController = ItemScrollController();

  _showChosenLetter(String letter, bool active, int matchIndex) {
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
    if (matchIndex >= 0)
      itemScrollController.scrollTo(
        index: matchIndex,
        duration: Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
  }

  @override
  Widget build(BuildContext context) {
    final _countriesList = Provider.of<Countries>(context, listen: false).getCountriesList;
    return Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              //width: MediaQuery.of(context).size.width * 0.9,
              child: ScrollablePositionedList.builder(
                itemCount: _countriesList.length,
                itemScrollController: itemScrollController,
                itemBuilder: (_, index) => CountryListTile(_countriesList[index]),
                ),
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
