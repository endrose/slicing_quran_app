import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_quran_app/globals.dart';

AppBar appBar() => AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: background,
      elevation: 0,
      title: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/svgs/menu-icon.svg'),
          ),
          const SizedBox(
            width: 24,
          ),
          Text(
            'Quran App',
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/svgs/search-icon.svg'),
          ),
        ],
      ),
    );
