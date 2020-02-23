import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomAppBar extends StatelessWidget {
  final List<Icon> icons;
  final List<String> iconsTitle;

  CustomBottomAppBar({@required this.icons, @required this.iconsTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          BottomAppBarButton(
            iconName: "countries_icon.png",
            title: "Countries",
            onTapFunction: () {
              print(" countries tapped");
            },
          ),
          BottomAppBarButton(
            iconName: "favs_icon.png",
            title: "Favs",
            onTapFunction: () {
              print(" favs tapped");
            },
          ),
          BottomAppBarButton(
            iconName: "recent_icon.png",
            title: "Recent",
            onTapFunction: () {
              print(" recent tapped");
            },
          ),
          BottomAppBarButton(
            iconName: "countries_search_icon.png",
            title: "Search",
            onTapFunction: () {
              print(" search tapped");
            },
          ),
        ],
      ),
      height: 66.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
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
    );
  }
}

class BottomAppBarButton extends StatefulWidget {
  final String iconName;
  final String title;
  final VoidCallback onTapFunction;

  BottomAppBarButton(
      {@required this.iconName,
      @required this.title,
      @required this.onTapFunction});

  @override
  _BottomAppBarButtonState createState() => _BottomAppBarButtonState();
}

class _BottomAppBarButtonState extends State<BottomAppBarButton> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      //type: MaterialType.transparency,
      color: _pressed ? Color(0xFFFFDA44) : Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () {
          widget.onTapFunction();
          this.setState(() {
            _pressed = true;
          });
        },
        //highlightColor: Colors.green,
        child: Container(
          padding: EdgeInsets.all(4.0),
          width: 70,
          height: 66,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Image(
                    image: AssetImage("assets/icons/${this.widget.iconName}")),
              ),
              Text(
                this.widget.title,
                style: GoogleFonts.lobster(
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
