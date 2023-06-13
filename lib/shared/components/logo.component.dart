import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../singletons/colors.singleton.dart';

class LogoComponent extends StatelessWidget {
  const LogoComponent({
    super.key,
    this.iconSize = 32,
    this.hasText = true,
    this.textSize = 24,
  });

  /// Will build the logo with just the icon in it's default size (32)
  factory LogoComponent.justIcon() => const LogoComponent(hasText: false);

  final double iconSize;
  final double textSize;
  final bool hasText;

  @override
  Widget build(BuildContext context) {
    if (hasText) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _IconComponent(iconSize: iconSize),
          const SizedBox(width: 8),
          Text(
            'motorsweb',
            style: GoogleFonts.comfortaa(
              fontWeight: FontWeight.w900,
              fontSize: textSize,
            ),
          ),
        ],
      );
    } else {
      return _IconComponent(iconSize: iconSize);
    }
  }
}

class _IconComponent extends StatelessWidget {
  const _IconComponent({
    required this.iconSize,
  });

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: iconSize,
      width: iconSize,
      decoration: BoxDecoration(
        color: MotorsColors.accentRed,
        borderRadius: BorderRadius.circular(iconSize * 2),
      ),
      alignment: Alignment.center,
      child: Icon(
        Icons.car_rental,
        color: Colors.white,
        size: iconSize * 0.7,
      ),
    );
  }
}
