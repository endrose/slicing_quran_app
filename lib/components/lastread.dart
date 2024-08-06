import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

Stack lastRead() => Stack(
      children: [
        Container(
          height: 131,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, .6, 1],
                colors: [
                  Color(0xFFDF98FA),
                  Color(0xFFB070FD),
                  Color(0xFF9055FF)
                ],
              )),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset('assets/svgs/quran.svg')),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/svgs/book.svg'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Last Read',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Al-Fatiah',
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                'Ayat No: 1',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
