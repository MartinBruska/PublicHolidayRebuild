import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:public_holiday/models/countries.dart';
import 'package:public_holiday/components/country_list_tile.dart';

import '../strings.dart';

class FavsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _favouriteList = context.select((Countries list) => list.getFavourites);

    return _favouriteList.isNotEmpty
        ? ListView.builder(
            itemCount: _favouriteList.length,
            itemBuilder: (_, index) => CountryListTile(_favouriteList[index]),
          )
        : Center(
            child: Text(Strings.NO_FAV_COUNTRY_ADDED),
          );
  }
}
