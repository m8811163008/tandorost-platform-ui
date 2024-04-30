import 'package:auth_repository/auth_repository.dart';
import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_repository/food_repository.dart';

import 'package:food_selection/food_selection.dart';
import 'package:food_selection/src/selected_foods_list/cubit/selected_foods_list_cubit.dart';
import 'package:user_repository/user_repository.dart';

class SelectedFoodsListPage extends StatelessWidget {
  const SelectedFoodsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectedFoodsListCubit(
        foodRepository: RepositoryProvider.of<FoodRepostiory>(context),
        userRepostiory: RepositoryProvider.of<UserRepostiory>(context),
        authRepostiory: RepositoryProvider.of<AuthRepostiory>(context),
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
                icon: const Icon(Ionicons.add),
                tooltip: 'اضافه کردن خوراک جدید',
              ),
              const FilterDateTimeIconButton(),
            ],
            fab: _UpgradeProfile(),
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
                    builder: (_) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: BlocProvider.value(
                          value: context.read<SelectedFoodsListCubit>(),
                          child: const CreateNewFoodBottomSheet(),
                        ),
                      );
                    },
                  );
                },
                tooltip: 'ساخت خوراک جدید از غذاهای انتخاب شده',
                icon: const Icon(
                  Ionicons.create_outline,
                ),
              ),
              // TODO food repeat
              // IconButton(
              //   onPressed: () {
              //     showModalBottomSheet(
              //       context: context,
              //       enableDrag: true,
              //       showDragHandle: true,
              //       isScrollControlled: true,
              //       builder: (context) {
              //         return Padding(
              //           padding: EdgeInsets.only(
              //             bottom: MediaQuery.of(context).viewInsets.bottom,
              //           ),
              //           child: const CreateNewFoodBottomSheet(),
              //         );
              //       },
              //     );
              //   },
              //   tooltip: 'تکرار خوردن غذای انتخاب شده',
              //   icon: const Icon(
              //     Ionicons.repeat_outline,
              //   ),
              // ),
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
      listenWhen: (previous, current) =>
          previous.creatingNewFoodFromSelectionStatus !=
          current.creatingNewFoodFromSelectionStatus,
      listener: (context, state) {
        if (state.creatingNewFoodFromSelectionStatus ==
            ProcessAsyncStatus.success) {
          context.showBanner(
            materialBanner: AppMaterialBanner(
              text: '${state.newFoodName} ساخته شد',
              actions: const [],
            ),
          );
          context.pop();
        } else if (state.creatingNewFoodFromSelectionStatus ==
            ProcessAsyncStatus.error) {
          context.showSnackbar(
            snackBar: const SnackBar(
              content: Text('An error occurred'),
            ),
          );
        }
      },
      buildWhen: (previous, current) =>
          previous.creatingNewFoodFromSelectionStatus !=
              current.creatingNewFoodFromSelectionStatus ||
          previous.newFoodName != current.newFoodName,
      builder: (context, state) {
        final isLoading = state.creatingNewFoodFromSelectionStatus ==
            ProcessAsyncStatus.loading;

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
              if (!isLoading)
                ElevatedButton(
                  onPressed: state.newFoodName.isNotEmpty
                      ? context
                          .read<SelectedFoodsListCubit>()
                          .newFoodFromSelectedFoodsCreated
                      : null,
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

class _UpgradeProfile extends StatelessWidget {
  const _UpgradeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SelectedFoodsListCubit>();
    return BlocBuilder<SelectedFoodsListCubit, SelectedFoodsListState>(
      builder: (context, state) {
        return state.selectedFoodsList.isNotEmpty
            ? UserRoleVisibility(
                userRoleStream: RepositoryProvider.of<AuthRepostiory>(context)
                    .currentUserRulesStream(),
                foodTrackerWidget: FloatingActionButton.extended(
                  heroTag: "btn1",
                  onPressed: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      isDismissible: true,
                      builder: (context) {
                        return FractionallySizedBox(
                          heightFactor: 0.8,
                          child: BlocProvider.value(
                            value: cubit,
                            child: Builder(builder: (context) {
                              return BlocConsumer<SelectedFoodsListCubit,
                                  SelectedFoodsListState>(
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
                                        .read<SelectedFoodsListCubit>()
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
                  label: Text('ارتقا کاربری'),
                ),
                dieterWidget: SizedBox.shrink(),
              )
            : SizedBox.shrink();
      },
    );
  }
}
