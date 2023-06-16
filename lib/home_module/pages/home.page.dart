import 'package:flutter/material.dart';
import 'package:motors_web/home_module/shared/aggregators/menu_entry.aggregator.dart';
import 'package:motors_web/home_module/shared/components/custom_app_bar.component.dart';
import 'package:motors_web/home_module/shared/components/search_box.component.dart';
// import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<String> menuItems = [
    'Buy',
    'Sell',
    'Services',
    'News',
    'Help',
  ];

  static String selectedMenu = menuItems.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBarComponent(
            menuEntries: menuItems
                .map(
                  (String entry) => MenuEntryAggregator(
                    itemName: entry,
                    isSelected: entry == selectedMenu,
                    callback: () => executeCallback(entry),
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: ListView(
              children: const <Widget>[
                SearchBoxComponent(),
              ],
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: Builder(
          builder: (BuildContext insideContext) => ListView(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Scaffold.of(insideContext).closeDrawer(),
              ),
              const Text('Custom Menu Entry'),
              const Text('Custom Menu Entry'),
              const Text('Custom Menu Entry'),
              const Text('Custom Menu Entry'),
              const Text('Custom Menu Entry'),
              const Text('Custom Menu Entry'),
              const Text('Custom Menu Entry'),
            ],
          ),
        ),
      ),
    );
  }

  void executeCallback(String itemName) {
    switch (itemName) {
      default:
        throw UnimplementedError();
    }
  }
}
