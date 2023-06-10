import 'package:flutter/material.dart';

class ResponsiveComponent extends StatelessWidget {
  const ResponsiveComponent({
    super.key,
    required this.largeScreen,
    required this.smallScreen,
  });

  final Widget largeScreen;
  final Widget smallScreen;

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isLargeScreen(BuildContext context) => !isSmallScreen(context);

  @override
  Widget build(BuildContext context) =>
      isLargeScreen(context) ? largeScreen : smallScreen;
}
