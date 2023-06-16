import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motors_web/shared/singletons/colors.singleton.dart';

class MenuEntry extends StatelessWidget {
  const MenuEntry({
    super.key,
    required this.text,
    this.isSelected = false,
    this.padding = 16,
    this.noLeftPadding = false,
    this.noRightPadding = false,
    this.textStyle,
    this.selectedTextStyle,
    this.indicatorHeight = 2,
  });

  final String text;
  final bool isSelected;
  final double padding;
  final bool noLeftPadding;
  final bool noRightPadding;
  final double indicatorHeight;

  final TextStyle? textStyle;
  final TextStyle? selectedTextStyle;

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultTextStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      color: MotorsColors.darkGrey,
      fontSize: 12,
    );

    final TextStyle defaultSelectedTextStyle = defaultTextStyle.copyWith();

    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        right: noRightPadding ? 0.0 : padding,
        left: noLeftPadding ? 0 : padding,
      ),
      decoration: isSelected
          ? BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: MotorsColors.accentRed,
                  width: indicatorHeight,
                ),
              ),
            )
          : null,
      child: Text(
        text,
        style: isSelected
            ? selectedTextStyle ?? defaultSelectedTextStyle
            : textStyle ?? defaultTextStyle,
      ),
    );
  }
}
