library constants;
import 'dart:ui';
import 'package:flutter/material.dart';

const ENDPOINT = "localhost:3000";
const PAGE_TRANSITION_DURATION = Duration(milliseconds: 200);

const double MAIN_MARGIN = 15;
const double INPUT_GROUP_HEIGHT = 50;
const TextStyle MONOSPACE_TEXT = TextStyle(
  fontFeatures: [
    FontFeature.tabularFigures()
  ],
  fontSize: 15,
  color: WHITE_1,
  height: 1.5,
  fontFamily: 'RobotoMono',
);

const Color BLACK_1 = Color(0xff000000);
const Color BLACK_2 = Color(0xff080808);
const Color BLACK_3 = Color(0xff101010);
const Color BLACK_5 = Color(0xff8a8a8a);

const Color WHITE_1 = Color(0xffbbbbbb);
const Color GREEN = Color(0xff00ff00);
const Color CYAN = Colors.cyanAccent;
const Color ORANGE = Color(0xfff57c00);