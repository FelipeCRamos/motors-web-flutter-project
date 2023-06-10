import 'package:flutter/material.dart';
import 'package:motors_web/home_module/shared/menu_entry.component.dart';
import 'package:motors_web/shared/components/logo.component.dart';
import 'package:motors_web/shared/components/responsive.component.dart';
import 'package:motors_web/shared/singletons/colors.singleton.dart';

class CustomAppBarComponent extends StatelessWidget {
  const CustomAppBarComponent({
    super.key,
    this.height = 56,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return ResponsiveComponent(
      largeScreen: _LargeAppBar(height: height),
      smallScreen: _SmallAppBar(height: height, menuCallback: () {}),
    );
  }
}

class _LargeAppBar extends StatefulWidget {
  const _LargeAppBar({
    required this.height,
    this.maxWidth = 950,
    this.outerPadding = 32,
    this.innerPadding = 16,
  });

  final double maxWidth;
  final double height;
  final double outerPadding;
  final double innerPadding;

  @override
  State<_LargeAppBar> createState() => _LargeAppBarState();
}

class _LargeAppBarState extends State<_LargeAppBar> {
  double _correctWidth(double currentWidth) =>
      currentWidth > widget.maxWidth ? widget.maxWidth : currentWidth;

  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.of(context).size.width;
    final double adjustedWidth = _correctWidth(currentWidth);

    return Container(
      height: widget.height,
      decoration: const BoxDecoration(color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: widget.outerPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxWidth: adjustedWidth,
              maxHeight: widget.height,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: widget.outerPadding),
                  child: const LogoComponent(),
                ),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MenuEntry(text: 'Comprar', isSelected: true),
                    MenuEntry(text: 'Vender'),
                    MenuEntry(text: 'Serviços'),
                    MenuEntry(text: 'Noticias'),
                    MenuEntry(text: 'Ajuda'),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      color: Colors.grey.shade300,
                      width: 1,
                      height: widget.height,
                      margin: EdgeInsets.symmetric(
                        horizontal: widget.innerPadding,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.person_outline_rounded,
                              color: MotorsColors.darkGrey,
                            ),
                            const Text('Entrar'),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.thumb_up_alt_outlined),
                      color: MotorsColors.darkGrey,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.chat_bubble_outline_rounded),
                      color: MotorsColors.darkGrey,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SmallAppBar extends StatefulWidget {
  const _SmallAppBar({
    required this.height,
    required this.menuCallback,
    this.outerPadding = 32,
  });

  final double height;
  final double outerPadding;
  final void Function() menuCallback;

  @override
  State<_SmallAppBar> createState() => _SmallAppBarState();
}

class _SmallAppBarState extends State<_SmallAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: const BoxDecoration(color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: widget.outerPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const LogoComponent(),
          IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.black87,
            onPressed: widget.menuCallback,
          ),
        ],
      ),
    );
  }
}
