import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture/screens/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // Here we set DM Sans as our default fonts
        // Now we also apply out text color to all flutter textTheme
        textTheme:
        GoogleFonts.dmSansTextTheme().apply(displayColor: kTextColor),
        // Almost all of our app bar have this style
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0, systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
