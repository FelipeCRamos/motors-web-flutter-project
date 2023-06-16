import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_module/pages/home.page.dart';
import 'shared/singletons/colors.singleton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'motorsweb | buy, sell and finance used cars',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: MotorsColors.accentRed,
          background: MotorsColors.lightGreyBackground,
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
