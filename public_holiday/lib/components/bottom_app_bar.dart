import 'package:flutter/material.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: const Image(
              image: AssetImage("assets/icons/countries_icon.png"),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Image(
              image: AssetImage("assets/icons/favs_icon.png"),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Image(
              image: AssetImage("assets/icons/recent_icon.png"),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Image(
              image: AssetImage("assets/icons/countries_search_icon.png"),
            ),
          ),
        ],
      ),
    );
  }
}
