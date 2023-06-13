import 'package:flutter/foundation.dart';
import 'package:motors_web/shared/abstract/aggregator.dart';

class MenuEntryAggregator implements Aggregator {
  const MenuEntryAggregator( {
    required this.itemName,
    required this.callback,
    this.isSelected = true,
  });

  final String itemName;
  final bool isSelected;
  final VoidCallback callback;
}
