import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class LoseWeightSpeedDialog extends StatelessWidget {
  const LoseWeightSpeedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: const EdgeInsets.all(16.0),
      contentPadding:
          const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      title: const Text('تفاوت انواع سرعت کاهش وزن'),
      children: [
        const Text('در حالت تثبیت وزن از انرژی مورد نیاز کم نمیشود'),
        SizedBox(
          height: context.sizesExtenstion.small,
        ),
        const Text(
          'در حالت آهسته و آسان در روز استراحت 10 درصد از انرژی مورد نیاز کم میشود و در روز تمرین 0 درصد از انرژی مورد نیاز کم میشود',
        ),
        SizedBox(
          height: context.sizesExtenstion.small,
        ),
        const Text(
          'در حالت طبیعی در روز استراحت 10 درصد از انرژی مورد نیاز کم میشود و در روز تمرین  5 درصد از انرژی مورد نیاز کم میشود',
        ),
        SizedBox(
          height: context.sizesExtenstion.small,
        ),
        const Text(
          'در حالت سریع و سخت در روز استراحت 15 درصد از انرژی مورد نیاز کم میشود و در روز تمرین  5 درصد از انرژی مورد نیاز کم میشود',
        ),
        SizedBox(
          height: context.sizesExtenstion.medium,
        ),
        Text(
          'مقدار کربوهیدرات از نوع غنی و کربوهیدرات از نوع میوه و سبزی و پروتئین و چربی  در روز تمرین و غیر تمرین متفاوت است ',
          style: context.themeData.textTheme.bodyMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
