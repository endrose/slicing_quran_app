import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Tab tabItem({required String label}) => Tab(
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
