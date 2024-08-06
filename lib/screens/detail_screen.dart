import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_quran_app/globals.dart';
import 'package:slicing_quran_app/models/ayat.dart';
import 'package:slicing_quran_app/models/surah.dart';

class DetailScreen extends StatelessWidget {
  final int noSurat;
  const DetailScreen({super.key, required this.noSurat});

  Future<Surah> getDetailSurah() async {
    final data = await Dio().get("https://equran.id/api/surat/$noSurat");

    return Surah.fromJson(json.decode(data.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Surah>(
        initialData: null,
        future: getDetailSurah(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: background,
            );
          }
          Surah surah = snapshot.data!;
          return Scaffold(
            backgroundColor: background,
            appBar: appBar(context: context, surah: surah),
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: details(surah: surah),
                ),
              ],
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView.separated(
                    itemBuilder: (context, index) => ayatItem(
                        ayat: surah.ayat!
                            .elementAt(index + (noSurat == 1 ? 1 : 0))),
                    separatorBuilder: (context, index) => Container(),
                    itemCount: surah.jumlahAyat + (noSurat == 1 ? -1 : 0)),
              ),
            ),
          );
        });
  }

  Widget ayatItem({required Ayat ayat}) => Padding(
        padding: EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: grey,
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Row(
                children: [
                  Container(
                    height: 27,
                    width: 27,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(27 / 2)),
                    child: Center(
                      child: Text(
                        "${ayat.nomor}",
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Icon(
                    Icons.play_arrow_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Icon(
                    Icons.bookmark_border_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text("${ayat.ar}",
                style: GoogleFonts.amiri(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right),
            const SizedBox(
              height: 16,
            ),
            Text("${ayat.tr}",
                style: GoogleFonts.amiri(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right),
            const SizedBox(
              height: 16,
            ),
            Text("${ayat.idn}",
                style: GoogleFonts.poppins(
                  color: text,
                  fontSize: 12,
                ),
                textAlign: TextAlign.left),
            const SizedBox(
              height: 16,
            ),
            Divider(color: const Color(0xFF7B80AD).withOpacity(.35))
          ],
        ),
      );

  Widget details({required Surah surah}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        children: [
          Container(
            height: 256,
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
              child: Opacity(
                  opacity: .2,
                  child: SvgPicture.asset(
                    'assets/svgs/quran.svg',
                    width: 324 - 55,
                  ))),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  surah.namaLatin,
                  style: GoogleFonts.poppins(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  surah.arti,
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.white.withOpacity(.35),
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      surah.tempatTurun.name,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2), color: text),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${surah.jumlahAyat} Ayat",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(
                  'assets/svgs/bismillah.svg',
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar appBar({required BuildContext context, required Surah surah}) =>
      AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: background,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: SvgPicture.asset('assets/svgs/back-icon.svg'),
            ),
            const SizedBox(
              width: 24,
            ),
            Text(
              surah.namaLatin,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svgs/search-icon.svg'),
            ),
          ],
        ),
      );
}
