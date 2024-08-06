import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../globals.dart';

BottomNavigationBarItem bottomNavigationBarItem(
        {required String icon, required String label}) =>
    BottomNavigationBarItem(
        icon: SvgPicture.asset(
          icon,
          color: text,
        ),
        activeIcon: SvgPicture.asset(icon, color: primary),
        label: label);
