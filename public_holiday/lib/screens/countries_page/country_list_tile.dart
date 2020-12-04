import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:public_holiday/models/country.dart';

class CountryListTile extends StatelessWidget {
  // final String flagImageName;
  // final String countryName;
  // final String countryId;

  // CountryListTile({
  //   @required this.flagImageName,
  //   @required this.countryName,
  //   @required this.countryId,
  // });

  @override
  Widget build(BuildContext context) {
    final country = Provider.of<Country>(context, listen: false);
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.only(
        left: 2.0,
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
              backgroundImage: AssetImage(
                "assets/images/${country.flagImageName}.jpg",
              ),
              radius: 27,
            ),
            title: Text(
              country.name,
              style: GoogleFonts.patuaOne(fontSize: 25),
            ),
            trailing: Consumer<Country>(
              builder: (context, country, _) => IconButton(
                  icon: Icon(
                    country.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 30,
                    color: Colors.red,
                  ),
                  onPressed: () => country.toggleFavouriteStatus()),
            ),
          ),
        ),
      ),
    );
  }
}
