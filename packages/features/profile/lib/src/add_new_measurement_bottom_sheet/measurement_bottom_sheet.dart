import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/src/add_new_measurement_bottom_sheet/cubit/add_measurement_cubit.dart';
import 'package:profile/src/widget/widget.dart';
import 'package:user_repository/user_repository.dart';

class MeasurementBottomSheet extends StatelessWidget {
  const MeasurementBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddMeasurementCubit(RepositoryProvider.of<UserRepostiory>(context)),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(child: MesurementForm()),
        ),
      ),
    );
  }
}

class MesurementForm extends StatelessWidget {
  const MesurementForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddMeasurementCubit>();
    return BlocListener<AddMeasurementCubit, AddMeasurementState>(
      listenWhen: (previous, current) =>
          previous.formSubmitStatus != current.formSubmitStatus,
      listener: (context, state) {
        if (state.formSubmitStatus.isError) {
          context.showSnackbar(
              snackBar: const SnackBar(content: Text('Erro has accured.')));
        } else if (state.formSubmitStatus.isSuccess) {
          context.pop();
        }
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'بروزرسانی اندازه جدید (اختیاری)',
                style: context.themeData.textTheme.labelMedium,
              ),
              const BodycompositionInfoIcon(),
            ],
          ),
          SizedBox(
            height: context.sizesExtenstion.medium,
          ),
          _buildTextFormField(
            autoFocus: true,
            label: 'دور کمر',
            suffixText: 'سانتی متر',
            hint: 'بین پایین ترین دنده ها و ستیغ تهیگاهی ',
            onChanged: cubit.upsertWaiseCircumference,
          ),
          SizedBox(
            height: context.sizesExtenstion.medium,
          ),
          _buildTextFormField(
            autoFocus: true,
            label: 'وزن',
            suffixText: 'کیلوگرم',
            onChanged: cubit.upsertWeight,
            isDouble: true,
          ),
          SizedBox(
            height: context.sizesExtenstion.medium,
          ),
          _buildTextFormField(
            label: 'دور باسن',
            suffixText: 'سانتی متر',
            onChanged: cubit.upsertHipCircumference,
          ),
          SizedBox(
            height: context.sizesExtenstion.medium,
          ),
          _buildTextFormField(
            label: 'دور ران',
            suffixText: 'سانتی متر',
            onChanged: cubit.upsertThightCircumference,
          ),
          SizedBox(
            height: context.sizesExtenstion.medium,
          ),
          _buildTextFormField(
            label: 'دور سینه',
            suffixText: 'سانتی متر',
            onChanged: cubit.upsertChestCircumference,
          ),
          SizedBox(
            height: context.sizesExtenstion.medium,
          ),
          _buildTextFormField(
            label: 'دور بازو',
            suffixText: 'سانتی متر',
            onChanged: cubit.upsertArmCircumference,
          ),
          SizedBox(
            height: context.sizesExtenstion.medium,
          ),
          _buildTextFormField(
            label: 'دور ماهیچه ساق پا',
            hint: 'حداکثر دور ماهیچه در حالت انقباض',
            suffixText: 'سانتی متر',
            onChanged: cubit.upsertCalfMuscleCircumference,
          ),
          SizedBox(
            height: context.sizesExtenstion.medium,
          ),
          const ActivityLevelDropdown(),
          SizedBox(
            height: context.sizesExtenstion.medium,
          ),
          Row(
            children: [
              const _SaveMeasurementButton(),
              SizedBox(
                width: context.sizesExtenstion.medium,
              ),
              OutlinedButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('انصراف'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField({
    String label = '',
    String suffixText = '',
    TextInputAction textInputAction = TextInputAction.next,
    bool autoFocus = false,
    String? hint,
    ValueSetter<String>? onChanged,
    bool isDouble = false,
  }) {
    return TextFormField(
      autofocus: autoFocus,
      keyboardType: TextInputType.numberWithOptions(decimal: isDouble),
      textInputAction: textInputAction,
      inputFormatters: [
        LengthLimitingTextInputFormatter(5),
        if (!isDouble)
          FilteringTextInputFormatter.digitsOnly
        else
          FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d?)$')),
      ],
      decoration: InputDecoration(
        labelText: label,
        suffixText: suffixText,
        hintText: hint,
      ),
      onChanged: onChanged,
    );
  }
}

class _SaveMeasurementButton extends StatelessWidget {
  const _SaveMeasurementButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddMeasurementCubit, AddMeasurementState>(
      buildWhen: (previous, current) =>
          previous.formSubmitStatus != current.formSubmitStatus ||
          previous.isFormValid != current.isFormValid,
      builder: (context, state) {
        return AppElevatedButton(
          isLoading: state.formSubmitStatus.isLoading,
          enabled: state.isFormValid,
          label: 'ذخیره',
        );
      },
    );
  }
}

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.enabled = true,
    this.label = '',
    this.isLoading = false,
  });
  final bool isLoading;
  final bool enabled;
  final String label;

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? ElevatedButton(
            onPressed: enabled
                ? context.read<AddMeasurementCubit>().saveNewMeasurement
                : null,
            child: Text(
              label,
            ),
          )
        : ElevatedButton.icon(
            onPressed: context.read<AddMeasurementCubit>().saveNewMeasurement,
            label: Text(
              label,
            ),
            icon: Transform.scale(
              scale: 0.7,
              child: const CircularProgressIndicator(),
            ),
          );
  }
}

class ActivityLevelDropdown extends StatelessWidget {
  const ActivityLevelDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<ActivityLevelCM>(
      onChanged:
          context.read<AddMeasurementCubit>().upsertActivityLevelChanging,
      hint: const Text('مقدار فعالیت در هفته'),
      items: ActivityLevelCM.values.map<DropdownMenuItem<ActivityLevelCM>>(
        (ActivityLevelCM activityLevelCM) {
          return DropdownMenuItem<ActivityLevelCM>(
            value: activityLevelCM,
            child: Text(context.l10n
                .profileActivityLevelButtonLabel(activityLevelCM.name)),
            // leadingIcon: Icon(icon.icon),
          );
        },
      ).toList(),
      selectedItemBuilder: (BuildContext context) {
        return ActivityLevelCM.values.map<Widget>((ActivityLevelCM item) {
          // This is the widget that will be shown when you select an item.
          // Here custom text style, alignment and layout size can be applied
          // to selected item string.
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              context.l10n.profileActivityLevelButtonLabel(item.name),
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList();
      },
    );
  }
}
