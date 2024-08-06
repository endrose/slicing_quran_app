import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_quran_app/globals.dart';
import 'package:slicing_quran_app/models/surah.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  Future<List<Surah>> getSurahList() async {
    String data = await rootBundle.loadString('assets/datas/list-surah.json');
    print(data);

    return surahFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>>(
      future: getSurahList(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // return const Center(child: CircularProgressIndicator());
          return Container();
        }

        return ListView.separated(
            itemBuilder: (context, index) => surahItem(
                context: context, surah: snapshot.data!.elementAt(index)),
            separatorBuilder: (context, index) => Divider(
                  color: const Color(0xFF7B80AD).withOpacity(.35),
                ),
            itemCount: snapshot.data!.length);
      },
    );
  }

  Widget surahItem({required Surah surah, required BuildContext context}) =>
      //
      Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Stack(
              children: [
                SvgPicture.asset('assets/svgs/nomor-surah.svg'),
                SizedBox(
                  height: 36,
                  width: 36,
                  child: Center(
                      child: Text(
                    "${surah.nomor}",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  )),
                )
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  surah.namaLatin,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      surah.tempatTurun.name,
                      style: GoogleFonts.poppins(
                          color: text,
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
                          color: text,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            )),
            Text(
              surah.nama,
              style: GoogleFonts.amiri(
                  color: primary, fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
}
