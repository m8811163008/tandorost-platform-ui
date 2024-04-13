import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_repository/food_repository.dart';

import 'package:food_selection/food_selection.dart';
import 'package:food_selection/src/selected_foods_list/cubit/selected_foods_list_cubit.dart';

class SelectedFoodsListPage extends StatelessWidget {
  const SelectedFoodsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectedFoodsListCubit(
        RepositoryProvider.of<FoodRepostiory>(context),
      ),
      // lazy: true,
      child: const SelectedFoodsListView(),
    );
  }
}

class SelectedFoodsListView extends StatelessWidget {
  const SelectedFoodsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedFoodsListCubit, SelectedFoodsListState>(
      // buildWhen: (previous, current) =>
      //     previous.selectedFoodsForNewFood.isEmpty !=
      //     current.selectedFoodsForNewFood.isEmpty,
      builder: (context, state) {
        // if (state.selectedFoodsForNewFood.isEmpty) {
        if (true) {
          return AppScaffold(
            isShowDrawerButton: true,
            actions: [
              IconButton(
                onPressed: () {
                  context.goNamed(Routes.foodSelection);
                },
                icon: const Icon(Ionicons.add),
                tooltip: 'اضافه کردن خوراک جدید',
              ),
              const FilterDateTimeIconButton(),
            ],
            child: const SelectedFoodListBuilder(),
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
                        child: const CreateNewFoodBottomSheet(),
                      );
                    },
                  );
                },
                tooltip: 'ساخت خوراک جدید از غذاهای انتخاب شده',
                icon: const Icon(
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
                        child: const CreateNewFoodBottomSheet(),
                      );
                    },
                  );
                },
                tooltip: 'تکرار خوردن غذای انتخاب شده',
                icon: const Icon(
                  Ionicons.repeat_outline,
                ),
              ),
              // FilterDateTimeIconButton(),
            ],
            child: const SelectedFoodListBuilder(),
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
    return BlocConsumer<SelectedFoodsListCubit, SelectedFoodsListState>(
      // listenWhen: (previous, current) =>
      //     previous.creatingNewFood != current.creatingNewFood,
      listener: (context, state) {
        // if (state.creatingNewFood == ProcessAsyncStatus.success) {
        //   context.showBanner(
        //     materialBanner: AppMaterialBanner(
        //       text: '${state.newFoodName} ساخته شد',
        //       actions: const [],
        //     ),
        //   );
        //   context.pop();
        // } else {
        //   context.showSnackbar(
        //     snackBar: const SnackBar(
        //       content: Text('با موفقیت ذخیره شد '),
        //     ),
        //   );
        // }
      },
      builder: (context, state) {
        // final isLoading = state.creatingNewFood == ProcessAsyncStatus.success;
        final isLoading = true;
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
                decoration: const InputDecoration(
                  hintText: 'نام غذا',
                ),
                onChanged:
                    context.read<SelectedFoodsListCubit>().newFoodNameUpdated,
              ),
              SizedBox(
                height: context.sizesExtenstion.medium,
              ),
              if (isLoading)
                ElevatedButton(
                  onPressed: null,
                  // onPressed: state.newFoodName.isNotEmpty
                  //     ? context
                  //         .read<SelectedFoodsListCubit>()
                  //         .newFoodFromSelectedFoodsCreated
                  //     : null,
                  child: const Text('ذخیره'),
                )
              else
                ElevatedButton.icon(
                  onPressed: null,
                  icon: Transform.scale(
                    scale: 0.7,
                    child: const CircularProgressIndicator(),
                  ),
                  label: const Text('ذخیره'),
                )
            ],
          ),
        );
      },
    );
  }
}
