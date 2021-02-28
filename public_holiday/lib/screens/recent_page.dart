import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:public_holiday/models/recent_countries.dart';

import '../components/country_list_tile.dart';
import '../strings.dart';

class RecentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _recentCountries =
        context.watch<RecentCountries>().getRecentCountries;

    return _recentCountries.isNotEmpty
        ? ListView.builder(
            itemCount: _recentCountries.length,
            itemBuilder: (_, index) => CountryListTile(_recentCountries[index]),
          )
        : Center(
            child: Text(Strings.NO_RECENT_COUNTRY_ADDED),
          );
  }
}
