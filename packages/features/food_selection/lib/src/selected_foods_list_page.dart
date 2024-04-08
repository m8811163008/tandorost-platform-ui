import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_selection/food_selection.dart';

class SelectedFoodsListPage extends StatelessWidget {
  const SelectedFoodsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodSelectionBloc, FoodSelectionState>(
      buildWhen: (previous, current) =>
          previous.selectedFoodsForNewFood.isEmpty !=
          current.selectedFoodsForNewFood.isEmpty,
      builder: (context, state) {
        if (state.selectedFoodsForNewFood.isEmpty) {
          return AppScaffold(
            isShowDrawerButton: true,
            actions: [
              IconButton(
                onPressed: () {
                  context.goNamed(Routes.foodSelection);
                },
                icon: Icon(Ionicons.add),
                tooltip: 'اضافه کردن خوراک جدید',
              ),
              FilterDateTimeIconButton(),
            ],
            child: SelectedFoodListBuilder(),
          );
        } else {
          return AppScaffold(
            // isShowDrawerButton: true,
            actions: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    enableDrag: true,
                    showDragHandle: true,
                    isScrollControlled: true,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: CreateNewFoodBottomSheet(),
                      );
                    },
                  );
                },
                tooltip: 'ساخت خوراک جدید از غذاهای انتخاب شده',
                icon: Icon(
                  Ionicons.create_outline,
                ),
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    enableDrag: true,
                    showDragHandle: true,
                    isScrollControlled: true,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: CreateNewFoodBottomSheet(),
                      );
                    },
                  );
                },
                tooltip: 'تکرار خوردن غذای انتخاب شده',
                icon: Icon(
                  Ionicons.repeat_outline,
                ),
              ),
              // FilterDateTimeIconButton(),
            ],
            child: SelectedFoodListBuilder(),
          );
        }
      },
    );
  }
}

class CreateNewFoodBottomSheet extends StatelessWidget {
  const CreateNewFoodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodSelectionBloc, FoodSelectionState>(
      listenWhen: (previous, current) =>
          previous.creatingNewFood != current.creatingNewFood,
      listener: (context, state) {
        if (state.creatingNewFood == ProcessAsyncStatus.loaded) {
          context.showBanner(
            materialBanner: AppMaterialBanner(
              text: '${state.newFoodName} ساخته شد',
              actions: const [],
            ),
          );
          context.pop();
        } else {
          context.showSnackbar(
            snackBar: SnackBar(
              content: Text('با موفقیت ذخیره شد '),
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.creatingNewFood == ProcessAsyncStatus.loaded;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                autofocus: true,
                enabled: !isLoading,
                textInputAction: TextInputAction.done,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(
                    50,
                  ),
                ],
                decoration: InputDecoration(
                  hintText: 'نام غذا',
                ),
                onChanged: (value) {
                  context
                      .read<FoodSelectionBloc>()
                      .add(NewFoodNameUpdated(value: value));
                },
              ),
              SizedBox(
                height: context.sizesExtenstion.medium,
              ),
              !isLoading
                  ? ElevatedButton(
                      onPressed: state.newFoodName.isNotEmpty
                          ? () {
                              context
                                  .read<FoodSelectionBloc>()
                                  .add(NewFoodFromSelectedFoodsCreated());
                            }
                          : null,
                      child: Text('ذخیره'),
                    )
                  : ElevatedButton.icon(
                      onPressed: null,
                      icon: Transform.scale(
                        scale: 0.7,
                        child: CircularProgressIndicator(),
                      ),
                      label: Text('ذخیره'),
                    )
            ],
          ),
        );
      },
    );
  }
}
