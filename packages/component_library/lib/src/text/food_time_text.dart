import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class FoodTimeLabelText extends StatelessWidget {
  const FoodTimeLabelText({super.key, required this.saveTimeOffset});
  final Duration saveTimeOffset;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: context.l10n
            .foodTimeInputDateTimeLabelText(saveTimeOffset.toTimeStatus().name),
        style: context.themeData.textTheme.bodyMedium,
        children: [
          const TextSpan(text: '\n'),
          if (saveTimeOffset.inHours != 0)
            WidgetSpan(
              child: SizedBox(
                width: 16,
                child: Text(saveTimeOffset.inHours.abs().toString()),
              ),
            ),
          TextSpan(
            text: context.l10n.foodTimeInputDateTimeLabelVelue(
                saveTimeOffset.toTimeStatus().name),
          ),
        ],
      ),
    );
  }
}

/// Used for the select option keys in translation in the arb file
enum _TimeStatus { past, now, future }

extension on Duration {
  _TimeStatus toTimeStatus() {
    if (inHours == 0) {
      return _TimeStatus.now;
    } else {
      return isNegative ? _TimeStatus.past : _TimeStatus.future;
    }
  }
}
