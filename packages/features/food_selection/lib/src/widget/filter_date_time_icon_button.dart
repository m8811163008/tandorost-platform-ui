import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class FilterDateTimeIconButton extends StatelessWidget {
  const FilterDateTimeIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Ionicons.calendar),
      onPressed: () async {
        final DateTimeRange? filterDateTimeRange =
            await showDialog<DateTimeRange>(
          context: context,
          builder: (_) {
            return BlocProvider.value(
              value: context.read<FoodSelectionBloc>(),
              child: const SelectDateTimeOptionDialog(),
            );
          },
        );
        if (filterDateTimeRange == null) return;
        if (!context.mounted) return;
        context.read<FoodSelectionBloc>().add(
              SlectedFoodListFiltered(dateTimeRange: filterDateTimeRange),
            );
      },
    );
  }
}
