import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomAppBar extends StatelessWidget {
  final List<Icon> icons;
  final List<String> iconsTitle;

  CustomBottomAppBar({@required this.icons, @required this.iconsTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFDA44),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment(0, 1),
          end: Alignment.topCenter,
          colors: [
            const Color(0xFFFFFFFF),
            const Color(0xFFFFDA44),
          ],
          tileMode: TileMode.clamp,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(1, 6),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          BottomAppBarButton(
            iconName: "countries_icon.png",
            title: "Countries",
            onTapFunction: null,
          ),
          BottomAppBarButton(
            iconName:"favs_icon.png",
            title: "Favs",
            onTapFunction: null,
          ),
          BottomAppBarButton(
            iconName:"recent_icon.png",
            title: "Recent",
            onTapFunction: null,
          ),
          BottomAppBarButton(
            iconName: "countries_search_icon.png",
            title: "Search",
            onTapFunction: null,
          ),
        ],
      ),
    );
  }
}

class BottomAppBarButton extends StatelessWidget {
  final String iconName;
  final String title;
  final Function onTapFunction;

  BottomAppBarButton(
      {@required this.iconName,
      @required this.title,
      @required this.onTapFunction});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapFunction,
      child: Container(
        width: 50,
        height: 55,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Image(image: AssetImage("assets/icons/${this.iconName}")),
            ),
            Text(
              this.title,
              style: GoogleFonts.lobster(
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
