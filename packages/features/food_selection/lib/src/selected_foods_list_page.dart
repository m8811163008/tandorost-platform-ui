import 'package:component_library/component_library.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_selection/food_selection.dart';

class SelectedFoodsListPage extends StatelessWidget {
  const SelectedFoodsListPage({super.key});
  static const String routeName = '/selected-foods-list';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: BlocBuilder<FoodSelectionBloc, FoodSelectionState>(
        buildWhen: (previous, current) =>
            previous.selectedFoodsList != current.selectedFoodsList,
        builder: (context, state) {
          if (state.selectedFoodsList.isEmpty) {
            return Text('empty List');
          }
          return ListView.builder(
            itemCount: state.selectedFoodsList.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return SelectedFoodListBanner();
              }
              final selectedFood = state.selectedFoodsList[index - 1];

              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SelectedFoodListTile(
                  selectedFood: selectedFood,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SelectedFoodListBanner extends StatelessWidget {
  const SelectedFoodListBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TotalNutitionsPieChart(
              fat: 10,
              carbohydrate: 15,
              protein: 64,
            ),
            SizedBox.square(
              dimension: 104,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ActionChip(
                    label: Text('dateTime'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: Text('انتخاب تاریخ'),
                            children: [
                              SimpleDialogOption(
                                child: Text('تا دیشب ساعت 00:00'),
                                onPressed: () {},
                              ),
                              SimpleDialogOption(
                                child: Text('از الان تا 7 روز پیش'),
                                onPressed: () {},
                              ),
                              SimpleDialogOption(
                                child: Text('انتخاب بازه زمانی'),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return SimpleDialog(
                                          title: Text('انتخاب تاریخ'),
                                          children: [
                                            SimpleDialogOption(
                                              child: Text('از روز'),
                                              onPressed: () {
                                                showDatePicker(
                                                  context: context,
                                                  firstDate: DateTime.now()
                                                    ..subtract(
                                                      Duration(days: 20),
                                                    ),
                                                  lastDate: DateTime.now().add(
                                                    Duration(days: 20),
                                                  ),
                                                );
                                              },
                                            ),
                                            SimpleDialogOption(
                                              child: Text('از ساعت'),
                                              onPressed: () {
                                                showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now(),
                                                );
                                              },
                                            ),
                                            Divider(),
                                            SimpleDialogOption(
                                              child: Text('تا روز'),
                                            ),
                                            SimpleDialogOption(
                                              child: Text('تا ساعت'),
                                            ),
                                          ],
                                        );
                                      });
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  Text('جمع ⚡️ 123 کیلوکالری')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
