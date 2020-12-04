import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:public_holiday/models/countries.dart';

class AlphabetScrollView extends StatelessWidget {
  final void Function(String letter, bool active, int matchIndex) parentAction;
  AlphabetScrollView({this.parentAction});
  final List<String> alphabet = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
  ];

  @override
  Widget build(BuildContext context) {
    final countriesList = Provider.of<Countries>(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.08,
      margin: EdgeInsets.only(top: 4.0, bottom: 4.0, right: 4.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFDA44),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        gradient: LinearGradient(
          begin: Alignment(1.5, 1.0),
          end: Alignment.bottomLeft,
          colors: [
            const Color(0xFFFFFFFF),
            const Color(0xFFFFDA44),
          ],
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
      child: ListView.builder(
        itemCount: alphabet.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              this.parentAction(alphabet[index], true,
                  countriesList.getFirstLetterMatchIndex(alphabet[index]));
            },
            child: Container(
              height: 35,
              child: Center(
                child: Text(
                  alphabet[index].toUpperCase(),
                  style: GoogleFonts.patuaOne(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
