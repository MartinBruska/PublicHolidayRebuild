import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:public_holiday/models/home_page.dart';

import './screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Public Holiday',
      home: ChangeNotifierProvider(
        create: (context) => HomePageModel(),
        child: HomePage(),
      ),
    );
  }
}
