import 'package:flutter/material.dart';
import 'package:slicing_quran_app/components/tab_item.dart';
import 'package:slicing_quran_app/globals.dart';

TabBar tabBar() => TabBar(
      tabs: [
        tabItem(label: "Surah"),
        tabItem(label: "Para"),
        tabItem(label: "Page"),
        tabItem(label: "Hijb"),
      ],
      unselectedLabelColor: text,
      labelColor: Colors.white,
      indicatorColor: primary,
      indicatorWeight: 3,
    );
