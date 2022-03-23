import 'dart:io';

import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travio/screens/navbar/ui/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarBrightness: Brightness.light,
      ));
    }
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context)
              .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
        ),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.grey),
      ),
      navigatorKey: Catcher.navigatorKey,
      home: Navbar(),
    );
  }
}
