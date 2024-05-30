import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/src/initialize_profile_wizard/cubit/initialize_user_cubit.dart';
import 'package:profile/src/widget/widget.dart';

class WizardPage3 extends StatelessWidget {
  const WizardPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return WizardPageConstrained(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          
          _buildBirthdayCard(context),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Builder(builder: (context) {
              return ShimmerTextNavigation(
                isError: context.select<InitializeUserCubit, bool>(
                  (cubit) =>
                      
                      cubit.state.createdProfileCM.birthday == null,
                ),
              );
            }),
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }



  Widget _buildBirthdayCard(BuildContext context) {
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
                Text(
                  context.l10n.profileBirthday,
                  style: context.themeData.textTheme.labelLarge,
                ),
                _buildBirthdayInfoIcon(context),
              ],
            ),
            SizedBox(
              height: context.sizesExtenstion.medium,
            ),
            BirthDayInput(
              initialDate: context
                  .read<InitializeUserCubit>()
                  .state
                  .createdProfileCM
                  .birthday,
              onSelectDate: context.read<InitializeUserCubit>().updateBirthDay,
            ),
            SizedBox(
              height: context.sizesExtenstion.medium,
            ),
            const _BirthdayContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildBirthdayInfoIcon(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: ((context) {
            return SimpleDialog(
              titlePadding: const EdgeInsets.all(16.0),
              contentPadding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              title: const Text('تاریخ تولد'),
              children: [
                Text.rich(
                  TextSpan(
                      text:
                          'برای اندازه گیری انرژی مورد نیاز روزانه و ارسال پیام تبریک، تاریخ تولد یا به دنیا آمدن را وارد کنید',
                      children: [
                        TextSpan(
                            text: 'پشتیبانی فعلی از سن 17 تا 50 است',
                            style: context.themeData.textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold)),
                      ]),
                ),
                SizedBox(
                  height: context.sizesExtenstion.medium,
                ),
                const Text(
                  'پیشنهاد اندازه خوراک به سن مرتبط است. نوجوان های زیر 17 سال و پیشکسوتان بالای 50 سال فعلا پشتیبانی نمیشود',
                ),
              ],
            );
          }),
        );
      },
      icon: const Icon(Ionicons.information_circle_outline),
    );
  }
}



class _BirthdayContent extends StatelessWidget {
  const _BirthdayContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: _buildBirthdayLabel(context),
        ),
        // _buildBirthdayInput(context),
      ],
    );
  }

  Widget _buildBirthdayInput(BuildContext context) {
    return ErrorIndicator(
      selector: (state) => state.createdProfileCM.birthday == null,
      child: SelectBirthdayButton(
        initialDate:
            context.read<InitializeUserCubit>().state.createdProfileCM.birthday,
        onSelectDate: context.read<InitializeUserCubit>().updateBirthDay,
      ),
    );
  }

  Widget _buildBirthdayLabel(BuildContext context) {
    return Builder(
      builder: (context) {
        final birthDay = context.select((InitializeUserCubit cubit) =>
            cubit.state.createdProfileCM.birthday);
        if (birthDay == null) {
          return const SizedBox.shrink();
        }
        final years = DateTime.now().difference(birthDay).inDays ~/ 365;

        return FittedBox(
          child: Text(
            'سن شما : ${context.l10n.profileAgeText(
              years.toString(),
            )}'
          ),
        );
      },
    );
  }
}

class BirthDayInput extends StatefulWidget {
  const BirthDayInput({super.key, this.onSelectDate, this.initialDate});
  final void Function(DateTime birthday, String birthdayShamsi)? onSelectDate;

  final DateTime? initialDate;

  @override
  State<BirthDayInput> createState() => _BirthDayInputState();
}

class _BirthDayInputState extends State<BirthDayInput> {
  late Jalali _selectedDate;
  @override
  void initState() {
    _selectedDate = Jalali.fromDateTime(widget.initialDate ?? DateTime.now());
    if(widget.initialDate == null){
      widget.onSelectDate?.call(_selectedDate.toDateTime(),
                          _buildShamsiDate(_selectedDate),);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 204,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('روز'),
                SizedBox(
                  height: context.sizesExtenstion.medium,
                ),
                Flexible(
                  child: ScrollableNumberInput(
                    intialValue: _selectedDate.day,
                    axis: Axis.vertical,
                    onSelectedNumberChanged: (number) {
                      setState(() {
                        _selectedDate = _selectedDate.copy(day: number);
                      });
                      widget.onSelectDate?.call(_selectedDate.toDateTime(),
                          _buildShamsiDate(_selectedDate));
                    },
                    min: 1,
                    max: 31,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            // width: MediaQuery.of(context).size.width / 3,
            child: Column(
              children: [
                Text('ماه'),
                SizedBox(
                  height: context.sizesExtenstion.medium,
                ),
                Flexible(
                  child: ScrollableNumberInput(
                    intialValue: _selectedDate.month,
                    axis: Axis.vertical,
                    onSelectedNumberChanged: (number) {
                      setState(() {
                        _selectedDate = _selectedDate.copy(month: number);
                      });
                      widget.onSelectDate?.call(_selectedDate.toDateTime(),
                          _buildShamsiDate(_selectedDate));
                    },
                    min: 1,
                    max: 12,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            // width: MediaQuery.of(context).size.width / 3,
            child: Column(
              children: [
                Text('سال'),
                SizedBox(
                  height: context.sizesExtenstion.medium,
                ),
                Flexible(
                  child: ScrollableNumberInput(
                    intialValue: _selectedDate.year,
                    axis: Axis.vertical,
                    onSelectedNumberChanged: (number) {
                      setState(() {
                        _selectedDate = _selectedDate.copy(year: number);
                      });
                      widget.onSelectDate?.call(_selectedDate.toDateTime(),
                          _buildShamsiDate(_selectedDate));
                    },
                    min: 1333,
                    max: 1403,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _buildShamsiDate(Jalali selectedDate) {
    final formatter = selectedDate.formatter;

    return '${formatter.dd}/${formatter.mm}/${formatter.yyyy}';
  }
}
