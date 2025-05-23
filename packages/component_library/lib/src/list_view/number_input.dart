import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';

class ScrollableNumberInput extends StatefulWidget {
  const ScrollableNumberInput({
    super.key,
    this.itemExtends = 60.0,
    this.min = 1,
    this.max = 10,
    this.onSelectedNumberChanged,
    this.axis = Axis.vertical,
    this.offAxisFraction = 0.0,
    this.step = 1,
    this.intialValue,
  });
  final double itemExtends;

  /// Included minimum value.
  final int min;

  /// Included maximum value.
  final int max;

  /// steps for inputs
  final int step;

  final Axis axis;
  final int? intialValue;
  final double offAxisFraction;

  final ValueChanged<int>? onSelectedNumberChanged;

  @override
  State<ScrollableNumberInput> createState() => _ScrollableNumberInputState();
}

class _ScrollableNumberInputState extends State<ScrollableNumberInput> {
  late final FixedExtentScrollController fixedExtentScrollController;

  int calculateValue(int index) => widget.min + (index * widget.step);
  int? calculateIndex(int? value) {
    if (value == null) return null;
    if (value == -1) return null;
    return (value - widget.min) ~/ widget.step;
  }

// add to prevent unnessary callback
  int? _lastSelectedIndex;

  @override
  void initState() {
    final intialIndex = calculateIndex(widget.intialValue) ??
        (widget.max - widget.min + 1) ~/ (2 * widget.step);
    fixedExtentScrollController =
        FixedExtentScrollController(initialItem: intialIndex);
    if (widget.intialValue == null) {
      widget.onSelectedNumberChanged?.call(calculateValue(intialIndex));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if ((widget.max - widget.min + 1) ~/ widget.step == -1) {
      return const SizedBox.shrink();
    }
    return ListWheelScrollViewX(
      controller: fixedExtentScrollController,
      itemExtent: widget.itemExtends,
      offAxisFraction: widget.offAxisFraction,
      scrollDirection: widget.axis,
      overAndUnderCenterOpacity: 0.6,
      onSelectedItemChanged: (index) {
        if (_lastSelectedIndex != null) {
          if (_lastSelectedIndex == index) return;
        }
        widget.onSelectedNumberChanged?.call(calculateValue(index));
        HapticFeedback.lightImpact();
        _lastSelectedIndex = index;
      },
      children: List.generate(
        (widget.max - widget.min + 1) ~/ widget.step,
        (index) {
          return SizedBox(
            width: widget.axis == Axis.horizontal
                ? widget.itemExtends * 1.68
                : null,
            child: Card(
              child: Center(
                child: Text(
                  calculateValue(index).toString(),
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
