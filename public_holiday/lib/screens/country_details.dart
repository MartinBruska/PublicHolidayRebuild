import 'package:flutter/material.dart';
import 'package:public_holiday/models/country.dart';

class CountryDetails extends StatelessWidget {
  final Country _country;

  CountryDetails(this._country);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(this._country.name),
    );
  }
}
