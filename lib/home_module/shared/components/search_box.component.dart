import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motors_web/home_module/shared/components/menu_entry.component.dart';
import 'package:motors_web/home_module/shared/components/raised_button.component.dart';
import 'package:motors_web/shared/singletons/colors.singleton.dart';

class SearchBoxComponent extends StatefulWidget {
  const SearchBoxComponent({
    super.key,
    this.buyCarsCallback,
    this.buyBikesCallback,
    this.wantToSellCallback,
    this.wantToFinanceCallback,
  });

  final VoidCallback? buyCarsCallback;
  final VoidCallback? buyBikesCallback;
  final VoidCallback? wantToSellCallback;
  final VoidCallback? wantToFinanceCallback;

  @override
  State<StatefulWidget> createState() => _SearchBoxComponentState();
}

class _SearchBoxComponentState extends State<SearchBoxComponent> {
  @override
  Widget build(BuildContext context) {
    const double fontSize = 16;
    const FontWeight fontWeight = FontWeight.w700;

    final TextStyle defaultTextStyle = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: MotorsColors.darkGrey.withOpacity(0.5),
    );

    final TextStyle defaultSelectedTextStyle =
        defaultTextStyle.copyWith(color: MotorsColors.darkGrey);

    const double indicatorHeight = 4.0;

    final OutlineInputBorder searchBoxBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: MotorsColors.lightGreyBackground,
      ),
      borderRadius: BorderRadius.circular(10.0),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        elevation: 1.0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(height: 48.0),
                child: Row(
                  children: <Widget>[
                    MenuEntry(
                      text: 'Buy cars',
                      isSelected: true,
                      textStyle: defaultTextStyle,
                      selectedTextStyle: defaultSelectedTextStyle,
                      indicatorHeight: indicatorHeight,
                    ),
                    MenuEntry(
                      text: 'Sell cars',
                      textStyle: defaultTextStyle,
                      selectedTextStyle: defaultSelectedTextStyle,
                      indicatorHeight: indicatorHeight,
                    ),
                    MenuEntry(
                      text: 'Want to sell',
                      textStyle: defaultTextStyle,
                      selectedTextStyle: defaultSelectedTextStyle,
                      indicatorHeight: indicatorHeight,
                    ),
                    MenuEntry(
                      text: 'Want to finance',
                      textStyle: defaultTextStyle,
                      selectedTextStyle: defaultSelectedTextStyle,
                      indicatorHeight: indicatorHeight,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Type vehicle vendor or model',
                        hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: MotorsColors.lightGreyForeground,
                          fontSize: 14.0,
                        ),
                        enabledBorder: searchBoxBorder,
                        focusedBorder: searchBoxBorder,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: RaisedButtonComponent.bigButton(
                      text: 'SEE OFFERS (41.928)',
                      callback: _seeOffersCallback,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _seeOffersCallback() {
    throw UnimplementedError();
  }
}
