import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class WaistCircumferenceSimpleDoialog extends StatelessWidget {
  const WaistCircumferenceSimpleDoialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: const EdgeInsets.all(16.0),
      contentPadding:
          const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      title: const Text('چطور دور کمر را اندازه بگیرم؟'),
      children: [
        Text.rich(
          TextSpan(
              text:
                  'روش اندازه گیری دور کمر به توصیه سازمان بهداشت جهانی و فدراسیون بین المللی دیابت ',
              children: [
                TextSpan(
                    text: 'بین پایین ترین دنده ها و ستیغ تهیگاهی ',
                    style: context.themeData.textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold)),
                const TextSpan(
                  text: 'است. ',
                )
              ]),
        ),
        SizedBox(
          height: context.sizesExtenstion.medium,
        ),
        const WaistCircumferenceImage(),
        SizedBox(
          height: context.sizesExtenstion.medium,
        ),
        const Text('بالاتر از ناف باشد و پوست زیر متر جمع نشود')
      ],
    );
  }
}
