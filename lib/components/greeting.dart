import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_quran_app/components/lastread.dart';
import 'package:slicing_quran_app/globals.dart';

Column greeting() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Asslamualaikum',
          style: GoogleFonts.poppins(
              color: text, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Endros',
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 24,
        ),
        lastRead()
      ],
    );
