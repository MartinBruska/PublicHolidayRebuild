import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget childWidget;

  @override
  final Size preferredSize;

  TopAppBar({@required this.title, @required this.childWidget})
      : preferredSize = Size.fromHeight(56.0);

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
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 46,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.calendar_today),
                      ),
                      Text(
                        this.title,
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
                  height: 46,
                  width: MediaQuery.of(context).size.width * 0.35,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
