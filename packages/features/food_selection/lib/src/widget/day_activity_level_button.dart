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
              segments: [
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
