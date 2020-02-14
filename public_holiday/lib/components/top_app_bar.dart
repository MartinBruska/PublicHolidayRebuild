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
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFDA44),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(10),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment(0, 0.5),
                    end: Alignment.topCenter,
                    colors: [const Color(0xFFFFDA44), const Color(0xFFFFFFFF)],
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
                width: MediaQuery.of(context).size.width * 0.6,
                height: 50,
                margin: const EdgeInsets.all(8.0),
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
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFDA44),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment(0, 0.5),
                    end: Alignment.topCenter,
                    colors: [const Color(0xFFFFDA44), const Color(0xFFFFFFFF)],
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
                height: 50,
                width: MediaQuery.of(context).size.width * 0.30,
                margin: const EdgeInsets.all(8.0),
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
            ],
          ),
        ],
      ),
    );
  }
}
