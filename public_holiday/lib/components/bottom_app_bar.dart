import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomAppBar extends StatelessWidget {
  final List<BottomAppBarButton> bottomAppBarButtons;

  CustomBottomAppBar(this.bottomAppBarButtons);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 66.0,
        width: MediaQuery.of(context).size.width,
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
          children: <Widget>[...bottomAppBarButtons],
        ),
      ),
    );
  }
}

class BottomAppBarButton extends StatelessWidget {
  final String iconName;
  final String title;
  final String active;
  final Function onTapFunction;

  BottomAppBarButton(
      {@required this.iconName,
      @required this.title,
      @required this.active,
      @required this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        width: 70,
        height: 55,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Image.asset(
                "assets/icons/$iconName",
              ),
            ),
            Text(title,
              style: GoogleFonts.lobster(
                fontSize: active == title ? 19 : 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
