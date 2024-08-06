import 'package:flutter/material.dart';
import 'package:slicing_quran_app/components/appbar.dart';
import 'package:slicing_quran_app/components/bottom_navigation_bar.dart';
import 'package:slicing_quran_app/components/greeting.dart';
import 'package:slicing_quran_app/components/tab_bar.dart';
import 'package:slicing_quran_app/components/tabs/hijb_tab.dart';
import 'package:slicing_quran_app/components/tabs/page_tab.dart';
import 'package:slicing_quran_app/components/tabs/para_tab.dart';
import 'package:slicing_quran_app/components/tabs/surah_tab.dart';
import 'package:slicing_quran_app/globals.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: background,
      bottomNavigationBar: bottomNavigationBar(),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              //
              SliverToBoxAdapter(
                child: greeting(),
              ),
              SliverAppBar(
                pinned: true,
                elevation: 0,
                backgroundColor: background,
                automaticallyImplyLeading: false,
                shape: Border(
                  bottom: BorderSide(
                      width: 3, color: const Color(0xFF8789A3).withOpacity(.1)),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: tabBar(),
                ),
              ),
            ],
            body: const TabBarView(
                children: [SurahTab(), ParaTab(), PageTab(), HijbTab()]),
          ),
        ),
      ),
    );
  }
}
