import 'dart:math';

import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return Transform.rotate(
      angle: widget.axis == Axis.horizontal ? -pi / 2 : 0,
      child: Container(
        constraints: BoxConstraints.tightFor(
            width: widget.itemExtends * 1.618, height: widget.itemExtends * 3),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black,
              width: 1,
            ),
            bottom: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),
        child: ListWheelScrollView(
          controller: fixedExtentScrollController,
          itemExtent: widget.itemExtends,
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
              return Card(
                child: Center(
                  child: Transform.rotate(
                    angle: widget.axis == Axis.horizontal ? pi / 2 : 0,
                    child: Text(
                      index.toString(),
                      style: context.themeData.textTheme.labelLarge,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
