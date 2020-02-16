import 'package:flutter/material.dart';
import 'package:public_holiday/components/bottom_app_bar.dart';
import 'package:public_holiday/components/top_app_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(title: "Public Holiday."),
      body: Center(
        child: Text("More to come"),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        icons: null,
        iconsTitle: null,
      ),
    );
  }
}
