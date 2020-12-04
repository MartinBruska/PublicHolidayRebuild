import 'package:flutter/material.dart';

class Country with ChangeNotifier {
  final String id;
  final String name;
  final String flagImageName;
  bool isFavourite;
  //ToDo list of holidays

  Country({
    @required this.id,
    @required this.name,
    @required this.flagImageName,
    this.isFavourite = false,
  });

  void toggleFavouriteStatus(){
    this.isFavourite = !this.isFavourite;
    notifyListeners();
  }
}
