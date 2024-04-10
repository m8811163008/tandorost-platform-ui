import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class BodyCompositionDialog extends StatelessWidget {
  const BodyCompositionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: const EdgeInsets.all(16.0),
      contentPadding:
          const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      title: const Text('شکل بدن'),
      children: [
        const Text(
            'بخاطر پیشگیری از وسواس فکری بیش از هفته‌ای یکبار خود را وزن نکنید.'),
        const Text(
          'اندازه گیری شکل بدن نسبت به اندازه گیری وزن بیشتر باعث انگیزه تناسب اندام میشود.',
        ),
        const Text(
          'با اندازه گیری شکل بدن متوجه میشوید توزیع کاهش چربی در بدن چه شکلی داشته',
        ),
        SizedBox(
          height: context.sizesExtenstion.medium,
        ),
        const BodyCompositionImage(),
        SizedBox(
          height: context.sizesExtenstion.medium,
        ),
        Text(
          'زمان اندازه گیری ماهیچه سرد باشد.',
          style: context.themeData.textTheme.bodyMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const Text(
          'حداکثر انقباض یا قطر ماهیچه را اندازه بگیرید.',
        ),
        const Divider(),
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
        const Text('بالاتر از ناف باشد و پوست زیر متر جمع نشود')
      ],
    );
  }
}
