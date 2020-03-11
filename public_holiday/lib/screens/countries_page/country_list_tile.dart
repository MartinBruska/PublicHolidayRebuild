import 'package:flutter/material.dart';

class CountryListTile extends StatelessWidget {
  final Image countryFlagImage;
  final String countryName;

  CountryListTile(
      {@required this.countryFlagImage, @required this.countryName});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: this.countryFlagImage,
        title: Text(this.countryName),
        trailing: Icon(Icons.favorite_border),
      ),
    );
  }
}
