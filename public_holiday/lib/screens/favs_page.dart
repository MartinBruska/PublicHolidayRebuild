import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/foundation.dart';
import 'package:faker/faker.dart';

// class FavsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(child: Text("Favs Page")),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _semicircleController = ScrollController();
  List<String> usersList = <String>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //generate the list
    for (int i = 0; i < 1000; i++) {
      usersList.add(faker.person.name());
    }

    //sort the list
    usersList.sort((a, b) {
      return a.toLowerCase().compareTo(b.toLowerCase());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SemicircleDemo(
      controller: _semicircleController,
      nameList: usersList,
    );
  }
}

class SemicircleDemo extends StatelessWidget {
  final List<String> nameList;

  final ScrollController controller;

  const SemicircleDemo({Key key, @required this.controller, this.nameList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollbar.semicircle(
      labelTextBuilder: (offset) {
        final int currentItem = offset ~/ 40;
        var letter = currentItem <= nameList.length - 1
            ? nameList[currentItem].substring(0, 1)
            : nameList.last.substring(0, 1);
        return Text("$letter");
      },
      alwaysVisibleScrollThumb: true,
      labelConstraints: BoxConstraints.tightFor(width: 80.0, height: 30.0),
      controller: controller,
      child: ListView.builder(
        controller: controller,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Container(
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color(0xFF4286f4), const Color(0xFFad3e67)],
                ),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10.0),
              child: new Text(nameList[index]),
            ),
          );
        },
        itemCount: nameList.length,
      ),
    );
  }
}
