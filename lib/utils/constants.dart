import 'package:flutter/material.dart';

// MISC
const widgetSlideShow = "slideshow";
const widgetAbout = "about";

const int slideShowDuration = 20;

// Margin
const EdgeInsets marginBottom12 = EdgeInsets.only(bottom: 12);
const EdgeInsets marginBottom24 = EdgeInsets.only(bottom: 24);
const EdgeInsets marginBottom40 = EdgeInsets.only(bottom: 40);

// Padding
const EdgeInsets paddingBottom24 = EdgeInsets.only(bottom: 24);

// Widgets

const Widget divider = Divider(color: Color(0xFFEEEEEE), thickness: 1);
Widget dividerSmall = Container(
  width: 40,
  decoration: const BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: Color(0xFFA0A0A0),
        width: 1,
      ),
    ),
  ),
);

//assets
const Map<String, String> assetMap = {
  'appvinaykhareLogo': 'assets/appicons/app_vinaykhare_logo.png',
  'appBarBackground': 'assets/images/background.jpg',
};
