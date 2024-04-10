import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/add_new_measurement_bottom_sheet/measurement_bottom_sheet.dart';
import 'package:profile/src/line_chart.dart';

class ProfileRoute extends StatelessWidget {
  const ProfileRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfilePageRedirector();
  }
}

class ProfilePageRedirector extends StatelessWidget {
  const ProfilePageRedirector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          previous.lastUpdatedProfileCM != current.lastUpdatedProfileCM,
      builder: (context, state) {
        if (state.lastUpdatedProfileCM == null ||
            state.lastUpdatedProfileCM == ProfileCM.empty()) {
          return const AppScaffold(
            isShowDrawerButton: true,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return const ProfileView();
      },
    );
  }
}

//  return ActivePremiumWizardRoute();
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isShowDrawerButton: true,
      actions: [
        IconButton(
          tooltip: 'بروز رسانی اندازه گیری جدید',
          onPressed: () {
            showModalBottomSheet(
              useSafeArea: true,
              context: context,
              isScrollControlled: true,
              isDismissible: false,
              enableDrag: false,
              showDragHandle: false,
              builder: (context) {
                return PopScope(
                  canPop: false,
                  child: BottomSheet(
                    enableDrag: false,
                    showDragHandle: false,
                    builder: (context) {
                      return MeasurementBottomSheet();
                    },
                    onClosing: () {},
                  ),
                );
              },
            );
          },
          icon: const Icon(
            Ionicons.add,
          ),
        ),
      ],
      child: ListView(
        children: [
          _buildProgreesCard(context),
          _buildProfileCard(context),
        ],
      ),
    );
  }

  Widget _buildProgreesCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('روند پیشرفت'),
                _buildBodyCompositionInfoIcon(context),
              ],
            ),
            const AppLineChartBuilder(),
            const AppLineChartInputChips(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('آیا مطمئن هستید؟ تمام داده ها ریست میشود.'),
                    actions: [
                      ResetButton(),
                      TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: Text('بازگشت'),
                      )
                    ],
                  ),
                );
              },
              child: Text('reset'),
            ),
            Placeholder(),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyCompositionInfoIcon(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: ((context) {
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
          }),
        );
      },
      icon: const Icon(Ionicons.information_circle_outline),
    );
  }
}

class ResetButton extends StatelessWidget {
  const ResetButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state.resettingStatus.isSuccess) {
          context.goNamed(Routes.splash);
        }
      },
      builder: (context, state) {
        return TextButton.icon(
          onPressed: !state.resettingStatus.isLoading
              ? context.read<ProfileCubit>().resetCollections
              : null,
          label: Text('ریست داده ها'),
          icon: !state.resettingStatus.isLoading
              ? SizedBox.shrink()
              : CircularProgressIndicator(),
        );
      },
    );
  }
}

class AppLineChartBuilder extends StatelessWidget {
  const AppLineChartBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProfileCubit, ProfileState, List<BioDataCM>?>(
      selector: (state) => state.lastUpdatedProfileCM?.bodyComposition.height,
      builder: (context, listData) {
        if (listData == null || listData.isEmpty) {
          return const SizedBox.shrink();
        }
        return AppLineChart(
          bioDataCMList: listData,
        );
      },
    );
  }
}

class AppLineChartInputChips extends StatelessWidget {
  const AppLineChartInputChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        InputChip(
          label: const Text('وزن'),
          onPressed: () {},
          selected: true,
        ),
        InputChip(
          label: const Text('وزن'),
          onPressed: () {},
          selected: false,
        ),
      ],
    );
  }
}
