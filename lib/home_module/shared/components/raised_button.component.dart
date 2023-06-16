import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motors_web/shared/singletons/colors.singleton.dart';

class RaisedButtonComponent extends StatelessWidget {
  const RaisedButtonComponent({
    super.key,
    required this.text,
    this.callback,
    this.padding,
    this.backgroundColor,
    this.textStyle,
  });

  factory RaisedButtonComponent.bigButton({
    required String text,
    VoidCallback? callback,
  }) {
    return RaisedButtonComponent(
      text: text,
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
      callback: callback,
    );
  }

  final String text;
  final VoidCallback? callback;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor ?? MotorsColors.accentRed,
        disabledForegroundColor: MotorsColors.accentRed.withOpacity(0.6),
        foregroundColor: Colors.white,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: textStyle ??
            GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
      ),
      child: Text(text),
    );
  }
}
