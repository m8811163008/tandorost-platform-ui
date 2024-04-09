import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile/src/widget/widget.dart';

class MeasurementBottomSheet extends StatelessWidget {
  const MeasurementBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'اضافه کردن اندازه جدید (اختیاری)',
                  style: context.themeData.textTheme.labelMedium,
                ),
                BodycompositionInfoIcon(),
              ],
            ),
            SizedBox(
              height: context.sizesExtenstion.medium,
            ),
            _buildTextFormField(
              autoFocus: true,
              label: 'وزن',
              suffixText: 'کیلوگرم',
              onChanged: (value) {},
            ),
            SizedBox(
              height: context.sizesExtenstion.medium,
            ),
            _buildTextFormField(
              label: 'دور باسن',
              suffixText: 'سانتی متر',
              onChanged: (value) {},
            ),
            SizedBox(
              height: context.sizesExtenstion.medium,
            ),
            _buildTextFormField(
              label: 'دور ران',
              suffixText: 'سانتی متر',
              onChanged: (value) {},
            ),
            SizedBox(
              height: context.sizesExtenstion.medium,
            ),
            _buildTextFormField(
              label: 'دور سینه',
              suffixText: 'سانتی متر',
              onChanged: (value) {},
            ),
            SizedBox(
              height: context.sizesExtenstion.medium,
            ),
            _buildTextFormField(
              label: 'دور بازو',
              suffixText: 'سانتی متر',
              onChanged: (value) {},
            ),
            SizedBox(
              height: context.sizesExtenstion.medium,
            ),
            _buildTextFormField(
              label: 'دور ماهیچه ساق پا',
              suffixText: 'سانتی متر',
              onChanged: (value) {},
            ),
            SizedBox(
              height: context.sizesExtenstion.medium,
            ),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('ذخیره')),
                SizedBox(
                  width: context.sizesExtenstion.medium,
                ),
                OutlinedButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text('انصراف'),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }

  Widget _buildTextFormField(
      {String label = '',
      String suffixText = '',
      TextInputAction textInputAction = TextInputAction.next,
      bool autoFocus = false,
      ValueSetter<String>? onChanged}) {
    return TextFormField(
      autofocus: autoFocus,
      keyboardType: TextInputType.numberWithOptions(),
      textInputAction: textInputAction,
      inputFormatters: [
        LengthLimitingTextInputFormatter(5),
      ],
      decoration: InputDecoration(
        labelText: label,
        suffixText: suffixText,
      ),
      onChanged: onChanged,
    );
  }
}
