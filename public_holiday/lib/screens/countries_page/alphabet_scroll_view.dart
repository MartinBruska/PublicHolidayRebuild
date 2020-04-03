import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlphabetScrollView extends StatelessWidget {
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
    'z'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.06,
      margin: EdgeInsets.only(right: 8.0),
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
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: this
              .alphabet
              .map((letter) => FlatButton(
                  padding: EdgeInsets.only(right: 2.0, left: 2.0),
                  onPressed: null,
                  child: Text(
                    letter.toUpperCase(),
                    style: GoogleFonts.patuaOne(
                      fontSize: 15,
                    ),
                  )))
              .toList()),
    );
  }
}
