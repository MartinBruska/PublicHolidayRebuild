import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:public_holiday/components/bottom_app_bar.dart';
import 'package:public_holiday/components/top_app_bar.dart';
import 'package:public_holiday/models/countries.dart';
import 'package:public_holiday/models/home_page.dart';
import 'package:public_holiday/models/recent_countries.dart';
import 'package:public_holiday/screens/countries_page/countries_page.dart';
import 'package:public_holiday/screens/favs_page.dart';
import 'package:public_holiday/screens/recent_page.dart';

import '../strings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    String _appBarTitle = context.watch<HomePageModel>().getAppBarTitle;
    String _active = context.watch<HomePageModel>().getActiveBtnTitle;
    bool _isCountryDetail = _active == Strings.COUNTRY_BTM_BAR_TITLE;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Countries()),
        ChangeNotifierProvider(create: (context) => RecentCountries()),
      ],
      child: Scaffold(
        appBar: TopAppBar(title: _appBarTitle),
        body: Consumer<HomePageModel>(
          builder: (context, homePage, _) {
            return homePage.getBuildBodyFunc();
          },
        ),
        bottomNavigationBar: CustomBottomAppBar(
          [
            BottomAppBarButton(
                iconName: "countries_icon.png",
                title: Strings.COUNTRIES_BTM_BAR_TITLE,
                active: _active,
                onTapFunction: () => context
                    .read<HomePageModel>()
                    .updateBodyBuild(() => CountriesPage(), Strings.APP_BAR_TITLE, Strings.COUNTRIES_BTM_BAR_TITLE)),
            // updateScreen(CountriesPage(), APP_TITLE, COUNTRIES_TITLE)),
            BottomAppBarButton(
                iconName: "favs_icon.png",
                title: Strings.FAVS_BTM_BAR_TITLE,
                active: _active,
                onTapFunction: () => context
                    .read<HomePageModel>()
                    .updateBodyBuild(() => FavsPage(), Strings.FAVS_APP_BAR_TITLE, Strings.FAVS_BTM_BAR_TITLE)),
            BottomAppBarButton(
                iconName: "recent_icon.png",
                active: _active,
                title: Strings.RECENT_BTM_BAR_TITLE,
                onTapFunction: () => context
                    .read<HomePageModel>()
                    .updateBodyBuild(() => RecentPage(), Strings.RECENT_APP_BAR_TITLE, Strings.RECENT_BTM_BAR_TITLE)),
            BottomAppBarButton(
                active: _active,
                iconName: _isCountryDetail ? "list.png" : "countries_search_icon.png",
                title: _isCountryDetail ? Strings.SPLIT_BTM_BAR_TITLE : Strings.SEARCH_BTM_BAR_TITLE,
                onTapFunction: () {}),
          ],
        ),
      ),
    );
  }
}
