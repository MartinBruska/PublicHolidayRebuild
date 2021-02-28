import 'package:flutter/material.dart';
import 'package:public_holiday/components/bottom_app_bar.dart';
import 'package:public_holiday/components/top_app_bar.dart';
import 'package:public_holiday/models/country.dart';

class CountryDetails extends StatefulWidget {
  final Country _country;

  CountryDetails(this._country) : assert(_country != null);

  @override
  _CountryDetailsState createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(title: widget._country.name),
      bottomNavigationBar: CustomBottomAppBar(
        [
          BottomAppBarButton(
            iconName: "countries_icon.png",
            title: "Countries",
            active: null,
            onTapFunction: () {
              Navigator.pop(context);
            },
          ),
          BottomAppBarButton(
            iconName: "favs_icon.png",
            title: "Favs",
            active: null,
            onTapFunction: () {
              Navigator.pop(context);
            },
          ),
          BottomAppBarButton(
            iconName: "recent_icon.png",
            active: null,
            title: "Recent",
            onTapFunction: () {
              Navigator.pop(context);
            },
          ),
          BottomAppBarButton(
            iconName: "list.png",
            active: null,
            title: "Split",
            onTapFunction: () {},
          ),
        ],
      ),
    );
  }
}
