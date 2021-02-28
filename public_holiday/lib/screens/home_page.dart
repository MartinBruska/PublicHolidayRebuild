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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String COUNTRIES_TITLE = "Countries";
  static const String FAVS_TITLE = "Favs";
  static const String RECENT_TITLE = "Recent";
  static const String SEARCH_TITLE = "Search";
  static const String APP_TITLE = "Public Holiday.";
  static const String APP_FAVS_TITLE = "Favourites";

  @override
  Widget build(BuildContext context) {

    String _appBarTitle = context.watch<HomePageModel>().getAppBarTitle;
    String _active = context.watch<HomePageModel>().getActiveTitle;

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
                title: COUNTRIES_TITLE,
                active: _active,
                onTapFunction: () => context
                    .read<HomePageModel>()
                    .updateBodyBuild(() => CountriesPage(), APP_TITLE, COUNTRIES_TITLE)),
            // updateScreen(CountriesPage(), APP_TITLE, COUNTRIES_TITLE)),
            BottomAppBarButton(
                iconName: "favs_icon.png",
                title: FAVS_TITLE,
                active: _active,
                onTapFunction: () => context
                    .read<HomePageModel>()
                    .updateBodyBuild(() => FavsPage(), APP_FAVS_TITLE, FAVS_TITLE)),
            BottomAppBarButton(
                iconName: "recent_icon.png",
                active: _active,
                title: RECENT_TITLE,
                onTapFunction: () => context
                    .read<HomePageModel>()
                    .updateBodyBuild(() => RecentPage(), RECENT_TITLE, RECENT_TITLE)),
            BottomAppBarButton(
                active: _active,
                iconName: "countries_search_icon.png",
                title: SEARCH_TITLE,
                onTapFunction: () {}),
          ],
        ),
      ),
    );
  }
}
