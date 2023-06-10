import 'package:flutter/material.dart';
import 'package:motors_web/home_module/shared/custom_app_bar.component.dart';
// import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomAppBarComponent(),
    );
  }
}
