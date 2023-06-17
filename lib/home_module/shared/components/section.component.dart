import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motors_web/shared/singletons/colors.singleton.dart';

class SectionComponent extends StatelessWidget {
  const SectionComponent({
    super.key,
    required this.headerTitle,
    this.sectionWidth,
    required this.child,
  });

  final String headerTitle;
  final double? sectionWidth;
  final Widget child;

  static const double defaultSectionWidth = 800;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightForFinite(
          width: sectionWidth ?? defaultSectionWidth,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                headerTitle,
                style: GoogleFonts.poppins(
                  color: MotorsColors.grey,
                  fontWeight: FontWeight.w800,
                  fontSize: 16.0,
                ),
              ),
            ),
            const Placeholder(
              fallbackHeight: 300,
            ),
          ],
        ),
      ),
    );
  }
}
