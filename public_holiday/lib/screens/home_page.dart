import 'package:flutter/material.dart';
import 'package:public_holiday/components/top_app_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(title: "Public Holiday."),
      body: Center(
        child: Text("More to come"),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 56.0,
          color: Colors.blue,
          child: Center(
            child: Text("Bottom Menu"),
          ),
        ),
      ),
    );
  }
}
