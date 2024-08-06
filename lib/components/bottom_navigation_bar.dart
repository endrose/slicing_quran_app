import 'package:flutter/material.dart';
import 'package:slicing_quran_app/components/bottom_navigation_bar_item.dart';
import 'package:slicing_quran_app/globals.dart';

BottomNavigationBar bottomNavigationBar() => BottomNavigationBar(
      backgroundColor: grey,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        bottomNavigationBarItem(
            icon: 'assets/svgs/quran-icon.svg', label: 'Quran'),
        bottomNavigationBarItem(
            icon: 'assets/svgs/lamp-icon.svg', label: 'Tips'),
        bottomNavigationBarItem(
            icon: 'assets/svgs/pray-icon.svg', label: 'Prayer'),
        bottomNavigationBarItem(icon: 'assets/svgs/doa-icon.svg', label: 'Doa'),
        bottomNavigationBarItem(
            icon: 'assets/svgs/bookmark-icon.svg', label: 'Bookmark'),
      ],
    );
