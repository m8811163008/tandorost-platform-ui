import 'dart:math';

import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';

class ScrollableNumberInput extends StatefulWidget {
  const ScrollableNumberInput(
      {super.key,
      this.itemExtends = 60.0,
      this.min = 0,
      this.max = 10,
      int stepCount = 10,
      this.onSelectedNumberChanged,
      this.axis = Axis.vertical})
      : stepCount = stepCount + 1;
  final double itemExtends;

  /// Included minimum value.
  final double min;

  /// Included maximum value.
  final double max;

  /// Number of steps between min and max.
  final int stepCount;

  final Axis axis;

  final ValueChanged<int>? onSelectedNumberChanged;

  @override
  State<ScrollableNumberInput> createState() => _ScrollableNumberInputState();
}

class _ScrollableNumberInputState extends State<ScrollableNumberInput> {
  late final FixedExtentScrollController fixedExtentScrollController;
  int _lastSelectedIndex = 0;

  @override
  void initState() {
    fixedExtentScrollController =
        FixedExtentScrollController(initialItem: widget.stepCount ~/ 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollViewX(
      controller: fixedExtentScrollController,
      itemExtent: widget.itemExtends,
      scrollDirection: widget.axis,
      overAndUnderCenterOpacity: 0.6,
      onSelectedItemChanged: (index) {
        if (_lastSelectedIndex == index) {
          return;
        }
        _lastSelectedIndex = index;
        widget.onSelectedNumberChanged?.call(index);
        HapticFeedback.lightImpact();
      },
      children: List.generate(
        widget.stepCount,
        (index) {
          return SizedBox(
            width: widget.axis == Axis.horizontal
                ? widget.itemExtends * 1.68
                : null,
            child: Card(
              child: Center(
                child: Text(
                  index.toString(),
                  style: context.themeData.textTheme.labelLarge,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
