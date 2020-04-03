import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryListTile extends StatelessWidget {
  final AssetImage countryFlagImage;
  final String countryName;

  CountryListTile(
      {@required this.countryFlagImage, @required this.countryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.only(
        left: 4.0,
      ),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(10),
        )),
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: this.countryFlagImage,
              radius: 27,
            ),
            title: Text(
              this.countryName,
              style: GoogleFonts.patuaOne(fontSize: 25),
            ),
            trailing: Icon(
              Icons.favorite,
              size: 30,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
