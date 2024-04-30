import 'package:component_library/src/helper.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SubscribeBottomSheet extends StatelessWidget {
  const SubscribeBottomSheet({super.key, this.onSelected});
  final ValueSetter<SubscriptionPlan>? onSelected;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      constraints: BoxConstraints.tight(
        Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.8),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(context.sizesExtenstion.medium),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: context.sizesExtenstion.small),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'ارتقای اشتراک',
                    style: context.themeData.textTheme.displaySmall,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: context.sizesExtenstion.small),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'تندرست با خدمات زیر باعث کاهش چربی و کاهش وزن شما میشود',
                    style: context.themeData.textTheme.labelLarge,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: context.sizesExtenstion.small),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            '1. انجام محاسبه درشت مغذی مورد نیاز شما (کربوهیدرات ،چربی،پروتین) در',
                        style: context.themeData.textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: ' روزهای ماهیچه سازی',
                        style: context.themeData.textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' و ',
                        style: context.themeData.textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: 'روزهای استراحت',
                        style: context.themeData.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: context.sizesExtenstion.small),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: '2. محاسبه انرژی مورد نیاز شما برای',
                            style: context.themeData.textTheme.bodyMedium),
                        TextSpan(
                          text: ' اپتیمم مقدار کاهش چربی',
                          style:
                              context.themeData.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _buildText(context, '3. دسترسی به خدمات کاهش وزن بدون بازگشت'),
              SizedBox(
                height: context.sizesExtenstion.large,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: context.sizesExtenstion.small),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'یکی را انتخاب نمایید',
                    style: context.themeData.textTheme.labelLarge,
                  ),
                ),
              ),
              Expanded(
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildProduct1(context,
                                'یک ماهه با 20٪ هدیه خرید اول', '173', '138'),
                            Spacer(),
                            OutlinedButton(
                              onPressed: () {
                                onSelected?.call(SubscriptionPlan.oneMonth);
                              },
                              child: Text('ارتقا به 1 ماهه'),
                            )
                          ],
                        ),
                      ),
                      VerticalDivider(
                        endIndent: context.sizesExtenstion.large,
                        indent: context.sizesExtenstion.large,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildProduct1(
                                context,
                                'سه ماهه با تخفیف 40٪ جشنواره طلایی',
                                '519',
                                '311'),
                            Spacer(),
                            OutlinedButton(
                              onPressed: () {
                                onSelected?.call(SubscriptionPlan.threeMonth);
                              },
                              child: Text('ارتقا به 3 ماهه'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: context.sizesExtenstion.medium,
              ),
            ],
          ),
        );
      },
      onClosing: () {},
    );
  }

  Padding _buildText(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.sizesExtenstion.small),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          text,
          style: context.themeData.textTheme.bodyMedium,
        ),
      ),
    );
  }

  Widget _buildProduct1(
      BuildContext context, String title, String price, String discountPrice) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: context.themeData.textTheme.labelLarge,
          ),
          TextSpan(
            text: '\n',
            style: context.themeData.textTheme.labelLarge,
          ),
          TextSpan(
            text: '\n',
            style: context.themeData.textTheme.labelLarge,
          ),
          TextSpan(
            text: price,
            style: context.themeData.textTheme.bodyMedium!.copyWith(
              decoration: TextDecoration.lineThrough,
            ),
          ),
          WidgetSpan(
              child: SizedBox(
            width: 8.0,
          )),
          TextSpan(
            text: discountPrice,
            style: context.themeData.textTheme.bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          WidgetSpan(
              child: SizedBox(
            width: 4.0,
          )),
          TextSpan(
            text: 'تومان',
            style: context.themeData.textTheme.bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
