import 'dart:async';

import 'package:flutter/material.dart';
import 'package:public_holiday/models/countries.dart';
import 'package:public_holiday/models/country.dart';
import 'package:public_holiday/screens/countries_page/alphabet_scroll_view.dart';
import 'package:public_holiday/screens/countries_page/country_list_tile.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CountriesPage extends StatefulWidget {
  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  Timer _debounce;
  bool _visible = false;
  String chosenLetter = "";
  final ItemScrollController itemScrollController = ItemScrollController();
  final List<Country> favouriteList = [];
  List<Country> countriesList;
  
//To Load dummy data
  @override
  void initState() {
     countriesList = Countries().generateDummyData(100);
     super.initState();
  }

    int _getFirstLetterMatchIndex(String letter) {
    return countriesList
        .indexWhere((country) => country.name.startsWith(letter));
  }

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

    int matchIndex = _getFirstLetterMatchIndex(letter.toUpperCase());
    if (matchIndex >= 0)
      itemScrollController.scrollTo(
        index: matchIndex,
        duration: Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
  }

  _toggleFavourite(String countryID) {
    int existingIndex =
        favouriteList.indexWhere((country) => country.id == countryID);
    if (existingIndex >= 0) {
      setState(() {
        favouriteList.removeAt(existingIndex);
        
      });
    } else {
      setState(() {
        favouriteList.add(
            countriesList.firstWhere((country) => country.id == countryID));
      });
    }
  }

  bool _isFavourite(String countryID) {
    return favouriteList.any((country) => countryID == country.id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              //width: MediaQuery.of(context).size.width * 0.9,
              child: ScrollablePositionedList.builder(
                  itemCount: countriesList.length,
                  itemScrollController: itemScrollController,
                  itemBuilder: (BuildContext context, int index) {
                    return CountryListTile(
                      flagImageName: countriesList[index].flagImageName,
                      countryName: countriesList[index].name,
                      countryId: countriesList[index].id,
                      toggleFavourite: _toggleFavourite,
                      isFavourite: _isFavourite,
                    );
                  }),
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
