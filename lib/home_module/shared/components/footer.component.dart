import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motors_web/shared/singletons/colors.singleton.dart';

class FooterComponent extends StatelessWidget {
  const FooterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: MotorsColors.darkGrey,
      margin: const EdgeInsets.only(top: 32.0),
      child: Column(
        children: <Widget>[
          _ColoredBar(
            child: RichText(
              text: TextSpan(
                text: 'Our support channels are 100% digital. Need any help? ',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'TAP HERE',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Wrap(
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.spaceBetween,
            spacing: 32.0,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _FooterColumn(
                    categoryTitle: 'Buy',
                    links: [
                      ('Used cars', '#'),
                      ('New cars', '#'),
                      ('Used bikes', '#'),
                      ('New bikes', '#'),
                      ('Inspected', '#'),
                    ],
                  ),
                  _FooterColumn(
                    categoryTitle: 'Sell',
                    links: [
                      ('Sell cars', '#'),
                      ('Sell bikes', '#'),
                      ('Manage Ads', '#'),
                      ('Reselling platform', '#'),
                    ],
                  ),
                ],
              ),
              _FooterColumn(
                categoryTitle: 'Services',
                links: [
                  ('FIPE Board', '#'),
                  ('Financing', '#'),
                  ('0km catalog', '#'),
                  ('Inspected', '#'),
                  ('Reselling platform', '#'),
                  ('Vehicle insurance', '#'),
                  ('Autoinsights', '#'),
                  ('Advertising', '#'),
                  ('Compare vehicles', '#'),
                  ('Fines and debts', '#'),
                ],
              ),
              _FooterColumn(
                categoryTitle: 'News MW',
                links: [
                  ('Portal', '#'),
                  ('Latest news', '#'),
                  ('Tryouts', '#'),
                  ('Compare', '#'),
                  ('Videos', '#'),
                  ('Bikes', '#'),
                  ('Secrets', '#'),
                  ('Tips and tricks', '#'),
                  ('Pocket', '#'),
                ],
              ),
              _FooterColumn(
                categoryTitle: 'Help',
                links: [
                  ('For you', '#'),
                  ('For your company', '#'),
                  ('Safety', '#'),
                  ('About us', '#'),
                  ('Work with us', '#'),
                  ('Site map', '#'),
                ],
              ),
              _FooterColumn(
                categoryTitle: 'Institutional',
                links: [
                  ('Ethics channel', '#'),
                  ('Code of conduct motorsweb', '#'),
                  ('Consumer laws', '#'),
                  ('Cookie management', '#'),
                  ('Terms and conditions', '#'),
                ],
              ),
            ],
          ),
          _ColoredBar(
            center: false,
            child: Text(
              'Sponsored by RedBank',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
          _ColoredBar(
            backgroundColor: MotorsColors.darkGrey,
            child: Text(
              '© 2023-2023 motorsweb. All rights reserved. Layout done for study purposes.',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ColoredBar extends StatelessWidget {
  const _ColoredBar({
    super.key,
    required this.child,
    this.center = true,
    this.backgroundColor,
  });

  final Widget child;
  final bool center;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor ?? MotorsColors.footerBgColor,
      child: Row(
        mainAxisAlignment:
            center ? MainAxisAlignment.center : MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}

class _FooterColumn extends StatelessWidget {
  const _FooterColumn({
    super.key,
    required this.categoryTitle,
    required this.links,
  });

  final String categoryTitle;
  final List<(String, String)> links;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              categoryTitle,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ...links.map(
            ((String title, String link) entry) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: _HoverLink(
                text: entry.$1,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                ),
                callback: () {
                  debugPrint('Calling link # ${entry.$2}');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HoverLink extends StatefulWidget {
  const _HoverLink({
    required this.text,
    required this.style,
    this.callback,
  });

  final String text;
  final TextStyle style;
  final VoidCallback? callback;

  @override
  State<StatefulWidget> createState() => _HoverLinkState();
}

class _HoverLinkState extends State<_HoverLink> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.callback,
      onHover: (bool state) => setState(() => _isHover = state),
      child: Text(
        widget.text,
        style: _isHover
            ? widget.style.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                decorationThickness: 1.0,
              )
            : widget.style,
      ),
    );
  }
}
