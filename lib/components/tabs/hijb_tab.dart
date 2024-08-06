import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_quran_app/globals.dart';

class HijbTab extends StatelessWidget {
  const HijbTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'Under Maintenance',
        style: GoogleFonts.poppins(
            fontSize: 30, fontWeight: FontWeight.bold, color: primary),
      )),
    );
  }
}
