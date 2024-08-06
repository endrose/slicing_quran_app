import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_quran_app/globals.dart';
import 'package:slicing_quran_app/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Quran App',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28)),
                const SizedBox(height: 16),
                Text(
                  'Learn Quran and \n Recite once everyday',
                  style: TextStyle(
                    color: text,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 49,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 450,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xFF672CBC)),
                      child: SvgPicture.asset('assets/svgs/splash.svg'),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: -23,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  30,
                                ),
                                color: orange),
                            child: Text(
                              'Get Started',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
