import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';

class ScrollableNumberInput extends StatefulWidget {
  const ScrollableNumberInput(
      {super.key,
      this.itemExtends = 60.0,
      this.min = 1,
      this.max = 10,
      this.onSelectedNumberChanged,
      this.axis = Axis.vertical});
  final double itemExtends;

  /// Included minimum value.
  final int min;

  /// Included maximum value.
  final int max;

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
    final initialItemIndex =
        widget.max < 500 ? widget.max ~/ 2 : widget.max ~/ 20;

    widget.onSelectedNumberChanged?.call(
        (widget.max < 500 ? (initialItemIndex) : (initialItemIndex) * 10));
    fixedExtentScrollController =
        FixedExtentScrollController(initialItem: initialItemIndex - 1);
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
        _lastSelectedIndex =
            (widget.max < 500 ? (index + 1) : (index + 1) * 10);
        widget.onSelectedNumberChanged?.call(_lastSelectedIndex);
        HapticFeedback.lightImpact();
      },
      children: List.generate(
        (widget.max < 500 ? widget.max : widget.max ~/ 10),
        (index) {
          return SizedBox(
            width: widget.axis == Axis.horizontal
                ? widget.itemExtends * 1.68
                : null,
            child: Card(
              child: Center(
                child: Text(
                  (widget.min + (widget.min * index)).toString(),
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
