import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomAppBar extends StatelessWidget {
  final List<String> iconsName;
  final List<String> iconsTitle;
  final Function(int) onPressed;
  final int activeIndex;

  CustomBottomAppBar(
      {@required this.iconsName,
      @required this.iconsTitle,
      @required this.onPressed,
      @required this.activeIndex});

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
          children: <Widget>[
            for (int i = 0; i < iconsName.length; i++)
              BottomAppBarButton(
                iconName: iconsName[i],
                title: iconsTitle[i],
                fontSize: i == activeIndex ? 19 : 14,
                onTapFunction: () => onPressed(i),
              ),
          ],
        ),
      ),
    );
  }
}

class BottomAppBarButton extends StatefulWidget {
  final String iconName;
  final String title;
  final VoidCallback onTapFunction;
  final double fontSize;

  BottomAppBarButton(
      {@required this.iconName,
      @required this.title,
      @required this.onTapFunction,
      @required this.fontSize});

  @override
  _BottomAppBarButtonState createState() => _BottomAppBarButtonState();
}

class _BottomAppBarButtonState extends State<BottomAppBarButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.widget.onTapFunction,
      child: Container(
        width: 70,
        height: 55,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Image.asset(
                "assets/icons/${this.widget.iconName}",
              ),
            ),
            Text(
              this.widget.title,
              style: GoogleFonts.lobster(
                fontSize: this.widget.fontSize,
              ),
            )
          ],
        ),
      ),
    );
  }
}
