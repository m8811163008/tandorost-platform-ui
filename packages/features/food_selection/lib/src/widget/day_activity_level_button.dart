import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/src/selected_foods_list/cubit/selected_foods_list_cubit.dart';

class DayActivityLevelSegementedButton extends StatelessWidget {
  const DayActivityLevelSegementedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocSelector<SelectedFoodsListCubit, SelectedFoodsListState,
            DayActivityLevel>(
          selector: (state) {
            return state.dayActivityLevel;
          },
          builder: (context, dayActivityLevel) {
            // TODO change to tabbar is it is ok in desing
            return SegmentedButton(
              segments: const [
                ButtonSegment(
                  value: DayActivityLevel.moderate,
                  label: Text('روز تمرین'),
                ),
                ButtonSegment(
                  value: DayActivityLevel.rest,
                  label: Text('روز استراحت'),
                )
              ],
              showSelectedIcon: false,
              selected: {dayActivityLevel},
              onSelectionChanged: (selectedSet) {
                context
                    .read<SelectedFoodsListCubit>()
                    .updateDayActivityLevel(selectedSet.single);
              },
            );
          },
        ),
      ),
    );
  }
}

class DayActivityLevelSegementedButtonPromotion extends StatelessWidget {
  const DayActivityLevelSegementedButtonPromotion({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocSelector<SelectedFoodsListCubit, SelectedFoodsListState,
            DayActivityLevel>(
          selector: (state) {
            return state.dayActivityLevel;
          },
          builder: (context, dayActivityLevel) {
            // TODO change to tabbar is it is ok in desing
            return SegmentedButton(
                segments: const [
                  ButtonSegment(
                    value: DayActivityLevel.moderate,
                    label: Text('روز تمرین'),
                  ),
                  ButtonSegment(
                    value: DayActivityLevel.rest,
                    label: Text('روز استراحت'),
                  )
                ],
                showSelectedIcon: false,
                selected: {DayActivityLevel.rest},
                onSelectionChanged: (_) async {
                  final cubit = context.read<SelectedFoodsListCubit>();
                  await showModalBottomSheet(
                    context: context,
                    isDismissible: true,
                    isScrollControlled: true,
                    // useRootNavigator: true,
                    builder: (context) {
                      return BlocProvider.value(
                        value: cubit,
                        child: FractionallySizedBox(
                          heightFactor: 0.8,
                          child: Builder(builder: (context) {
                            return SubscribeBottomSheet(
                              onSelected: context
                                  .read<SelectedFoodsListCubit>()
                                  .subscribe,
                            );
                          }),
                        ),
                      );
                    },
                  );
                });
          },
        ),
      ),
    );
  }
}
