import 'package:flutter/material.dart';
import 'package:public_holiday/components/bottom_app_bar.dart';
import 'package:public_holiday/components/top_app_bar.dart';
import 'package:public_holiday/screens/favs_page.dart';
import 'package:public_holiday/screens/recent_page.dart';
import 'package:public_holiday/screens/countries_page/countries_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var navIndex = 0;

  final pages = List<Widget>.unmodifiable([
    CountriesPage(),
    FavsPage(),
    RecentPage(),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(title: "Public Holiday."),
      body: pages[navIndex],
      bottomNavigationBar: CustomBottomAppBar(
        iconsName: [
          "countries_icon.png",
          "favs_icon.png",
          "recent_icon.png",
          "countries_search_icon.png"
        ],
        iconsTitle: [
          "Countries",
          "Favs",
          "Recent",
          "Search"
        ],
        onPressed: (i) => setState(() => navIndex = i),
        activeIndex: navIndex,
      ),
    );
  }
}
