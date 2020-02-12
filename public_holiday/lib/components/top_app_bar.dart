import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget childWidget;

  @override
  final Size preferredSize;

  TopAppBar({@required this.title, @required this.childWidget})
      : preferredSize = Size.fromHeight(70.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //To Do: try to run it without column widget
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Card(
                color: Colors.yellow,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFFFFDA44),
                        const Color(0xFFFFFFFF)
                      ],
                      tileMode: TileMode.repeated,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: const Image(
                          image: AssetImage("assets/icons/calendar_icon.png"),
                        ),
                      ),
                      Text(
                        this.title,
                        style: GoogleFonts.lobster(
                          fontSize: 26,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.yellow,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.notifications,
                          size: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.more_vert,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
