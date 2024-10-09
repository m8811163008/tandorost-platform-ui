import 'package:auth_repository/auth_repository.dart';
import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vo2max_calculator/cubit/vo2max_calculator_cubit.dart';

class Vo2maxCalculatorRoute extends StatelessWidget {
  const Vo2maxCalculatorRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Vo2maxCalculatorCubit(
          authRepostiory: RepositoryProvider.of<AuthRepostiory>(context)),
      child: Vo2maxCalculatorView(),
    );
  }
}

class Vo2maxCalculatorView extends StatelessWidget {
  const Vo2maxCalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isShowDrawerButton: true,
      child: Vo2maxCalculatorCard(),
    );
  }
}

class Vo2maxCalculatorCard extends StatefulWidget {
  const Vo2maxCalculatorCard({super.key});

  @override
  State<Vo2maxCalculatorCard> createState() => _Vo2maxCalculatorCardState();
}

class _Vo2maxCalculatorCardState extends State<Vo2maxCalculatorCard> {
  double vo2max = 0;
  double maxDistanceInMeterInOneMinues = 0;
  @override
  Widget build(BuildContext context) {
    return _buildEnergyCard(context);
  }

  Widget _buildEnergyCard(BuildContext context) {
    final cubit = context.read<Vo2maxCalculatorCubit>();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                line1,
                textAlign: TextAlign.justify,
              ),
              Text(
                line2,
                textAlign: TextAlign.justify,
              ),
              Text(
                line3,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: context.sizesExtenstion.medium,
              ),
              FuelMixtureImage(),
              SizedBox(
                height: context.sizesExtenstion.medium,
              ),
              Text(
                line4,
                textAlign: TextAlign.justify,
              ),
              Divider(),
              Text(
                line5,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: context.sizesExtenstion.medium,
              ),
              Text(
                line6,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: context.sizesExtenstion.medium,
              ),
              UserRoleVisibility(
                userRoleStream: RepositoryProvider.of<AuthRepostiory>(context)
                    .currentUserRulesStream(),
                foodTrackerWidget: TextField(
                  decoration: InputDecoration(
                    labelText: 'مسافت طی شده به متر',
                    hintText: 'مسافت طی شده در ۱۲ دقیقه به متر',
                  ),
                  readOnly: true,
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      isDismissible: true,
                      isScrollControlled: true,
                      // useRootNavigator: true,
                      builder: (context) {
                        return FractionallySizedBox(
                          heightFactor: 0.8,
                          child: BlocProvider.value(
                            value: cubit,
                            child: Builder(builder: (context) {
                              return BlocConsumer<Vo2maxCalculatorCubit,
                                  Vo2maxCalculatorState>(
                                listenWhen: (previous, current) =>
                                    previous.puchaseSubscriptionStatus !=
                                    current.puchaseSubscriptionStatus,
                                listener: (context, state) {
                                  if (state.puchaseSubscriptionStatus
                                          .isSuccess ||
                                      state.puchaseSubscriptionStatus.isError) {
                                    context.pop();
                                    context.goNamed(Routes.splash);
                                  }
                                },
                                builder: (context, state) {
                                  return SubscribeBottomSheet(
                                    onSelected: context
                                        .read<Vo2maxCalculatorCubit>()
                                        .subscribe,
                                  );
                                },
                              );
                            }),
                          ),
                        );
                      },
                    );
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  textInputAction: TextInputAction.done,
                ),
                dieterWidget: TextField(
                  decoration: InputDecoration(
                    labelText: 'مسافت طی شده به متر',
                    hintText: 'مسافت طی شده در ۱۲ دقیقه به متر',
                  ),
                  onChanged: (value) {
                    setState(() {
                      vo2max = (22.351 * (int.parse(value) / 1000)) - 11.288;
                      // in 12 minues
                      maxDistanceInMeterInOneMinues =
                          ((0.62 * vo2max) + 11.288) * 1000 / (22.351 * 12);
                    });
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  textInputAction: TextInputAction.done,
                ),
                // foodTrackerWidget: FastingSegmentedButtons(),
              ),
              if (vo2max != 0) ...[
                SizedBox(
                  height: context.sizesExtenstion.medium,
                ),
                Text(
                  'مقدار VO2max شما ${vo2max.toStringAsFixed(2)} می‌باشد',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'مسافت بهینه شما در 62 درصد VO2max در هر دقیقه ${maxDistanceInMeterInOneMinues.toStringAsFixed(1)} متر میباشد',
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: context.sizesExtenstion.medium,
                ),
                Text(
                  'برای حداکثر کردن سرعت چربی سوزی بعد از تمرین مقاومتی بین 15 تا 30 دقیقه تمرین هوازی انجام دهید',
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: context.sizesExtenstion.medium,
                ),
                Text(
                  'در ۲۰ دقیقه مسافت ${(maxDistanceInMeterInOneMinues * 20).toStringAsFixed(2)} متر را با سرعت متوسط طی کنید',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'یا در 15 دقیقه مسافت ${(maxDistanceInMeterInOneMinues * 15).toStringAsFixed(2)} متر را با سرعت متوسط طی کنید',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'یا در 25 دقیقه مسافت ${(maxDistanceInMeterInOneMinues * 25).toStringAsFixed(2)} متر را با سرعت متوسط طی کنید',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'یا در 30 دقیقه مسافت ${(maxDistanceInMeterInOneMinues * 30).toStringAsFixed(2)} متر را با سرعت متوسط طی کنید',
                  textAlign: TextAlign.justify,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

final String line1 =
    'در طول تمرینات با شدت کم، چربی سوخت اصلی است، در حالی که کربوهیدرات سوخت اصلی در تمرینات با شدت بالا است. ';
final String line2 =
    'با این حال، اکسیداسیون کل چربی بر حسب گرم با افزایش شدت ورزش از کم به زیاد افزایش می‌یابد، حتی اگر درصد سهم چربی کاهش یابد. این به این دلیل است که کل انرژی مصرفی افزایش می یابد، یعنی کالری بیشتری در دقیقه می سوزانید.';
final String line3 =
    ' به طور متوسط، بالاترین نرخ اکسیداسیون چربی ("fat max") در 62-63٪ VO2max رخ می دهد.';
final String line4 =
    'هر چه شدت تمرین بیشتر باشد، سرعت شکسته شدن گلیکوژن ماهیچه بیشتر می شود.';
final String line5 =
    'برای محاسبه مقدار بهینه و بهترین سرعت برای حداکثر چربی سوزی ابتدا تست کوپر را اجرا میکنیم و سپس مقدار بهینه مسافتی که باید با سرعت تقریبا ثابت در زمان کاردیو راه بروید را محاسبه میکنیم';
final String line6 =
    'به مدت ۱۲ دقیقه روی تردمیل یا زمین صاف حداکثر مسافتی که میتوانید، بدوید و سپس مسافت را به متر برای محاسبه VO2max در زیر وارد کنید';
