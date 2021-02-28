import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:public_holiday/models/countries.dart';
import 'package:public_holiday/models/country.dart';
import 'package:public_holiday/models/home_page.dart';
import 'package:public_holiday/models/recent_countries.dart';
import 'package:public_holiday/screens/country_details.dart';

class CountryListTile extends StatelessWidget {
  final Country _country;

  CountryListTile(this._country): assert(_country != null);

  @override
  Widget build(BuildContext context) {
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
                "assets/images/${_country.flagImageName}.jpg",
              ),
              radius: 27,
            ),
            title: Text(
              _country.name,
              style: GoogleFonts.patuaOne(fontSize: 25),
            ),
            trailing: Consumer<Countries>(
              builder: (context, country, _) => IconButton(
                  icon: Icon(
                    _country.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 30,
                    color: Colors.red,
                  ),
                  onPressed: () => {
                        context
                            .read<Countries>()
                            .toggleFavouriteStatus(_country)
                      }),
            ),
            onTap: () => {
              context.read<RecentCountries>().addToRecentCountries(_country),
              context.read<HomePageModel>().updateBodyBuild(() => CountryDetails(_country), _country.name, "countryDetail")
            },
          ),
        ),
      ),
    );
  }
}