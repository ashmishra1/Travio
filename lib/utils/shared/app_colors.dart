import 'package:flutter/material.dart';

Color color1 = Colors.indigoAccent.shade200;
Color color2 = Colors.orange.withOpacity(0.02);
const Color kcMediumGreyColor = Color(0xff868686);
const Color kcLightGreyColor = Color(0xffe5e5e5);
const Color kcVeryLightGreyColor = Color(0xFFFFFFFF);
const Color kcBlackBackgroundColor = Color(0xFFFFFFFF);
const Color kcLightBackgroundColor = Color(0xFF111111);
var grad2 = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Colors.tealAccent.shade200, Colors.tealAccent.shade700]);

var grad1 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.indigoAccent.shade200, Colors.blueAccent.shade400]);

var grad3 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.black.withOpacity(0.08), Colors.black.withOpacity(0.08)]);
