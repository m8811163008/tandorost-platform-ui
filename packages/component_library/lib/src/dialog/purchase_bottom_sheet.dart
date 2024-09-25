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
                    'مشکل چاقی و اضافه وزن باعث بیماری های قلبی عروقی، دیابت، سرطان‌ها، اختلالات عصبی، بیماری های مزمن تنفسی و اختلالات گوارشی است',
                    style: context.themeData.textTheme.labelLarge,
                  ),
                ),
              ),
              _buildText(context,
                  'جلوگیری از مرگ زودرس با تناسب اندام به سادگی امکان پذیر است'),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: context.sizesExtenstion.small),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: '1. سریع ترین روش کاهش وزن با',
                            style: context.themeData.textTheme.bodyMedium),
                        TextSpan(
                          text: ' حداقل کاهش چربی حتی بدون ورزش',
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
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: context.sizesExtenstion.small),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            '2. انجام محاسبه درشت مغذی مورد نیاز شما (کربوهیدرات ،چربی،پروتین) در',
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
              DirectSaleUnlocker(
                child: _buildText(context, 'به همراه پشتیبانی تلفنی '),
                onDone: () {
                  onSelected?.call(SubscriptionPlan.oneMonthCashPayment);
                },
              ),
              SizedBox(
                height: context.sizesExtenstion.large,
              ),
              // DirectSaleUnlocker(
              //   child: SizedBox(
              //     height: context.sizesExtenstion.large,

              //   ),
              //   // child: Text(
              //   //   'context.sizesExtenstion.large',
              //   // ),
              //   onDone: () {
              //     onSelected?.call(SubscriptionPlan.oneMonthCashPayment);
              //   },
              // ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: context.sizesExtenstion.small),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'برای ارتقا یکی را انتخاب نمایید',
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
                            _buildProduct1(context, 'یک ماهه با 20٪ هدیه خرید',
                                '173', '138'),
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
                              'سه ماهه ',
                              '519',
                              '311',
                            ),
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

class DirectSaleUnlocker extends StatefulWidget {
  const DirectSaleUnlocker(
      {super.key, required this.child, required this.onDone});
  final Widget child;
  final VoidCallback onDone;

  @override
  State<DirectSaleUnlocker> createState() => _DirectSaleUnlockerState();
}

class _DirectSaleUnlockerState extends State<DirectSaleUnlocker> {
  int _touched = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _touched++;
        if (_touched == 7) {
          widget.onDone();
        }
      },
      child: widget.child,
    );
  }
}
