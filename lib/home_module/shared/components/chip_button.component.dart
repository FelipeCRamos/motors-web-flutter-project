import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motors_web/shared/singletons/colors.singleton.dart';

class ChipButton extends StatelessWidget {
  const ChipButton({super.key, required this.text, this.callback});

  final String text;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Icon(
            Icons.person_outline_rounded,
            color: MotorsColors.darkGrey,
          ),
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
            color: MotorsColors.darkGrey,
          ),
        ),
      ],
    );
  }
}
