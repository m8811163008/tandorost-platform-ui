import 'package:component_library/component_library.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpsertFoodBottomSheet extends StatefulWidget {
  UpsertFoodBottomSheet(
      {super.key, this.onfoodUpdated, FoodCM? initalFood, this.initalName})
      : initalFood = initalFood ?? FoodCM();
  final ValueSetter<FoodCM>? onfoodUpdated;

  final FoodCM initalFood;
  final String? initalName;

  @override
  State<UpsertFoodBottomSheet> createState() => _UpsertFoodBottomSheetState();
}

class _UpsertFoodBottomSheetState extends State<UpsertFoodBottomSheet>
    with TickerProviderStateMixin {
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _weightTextEditingController =
      TextEditingController();
  final TextEditingController _calorieTextEditingController =
      TextEditingController();
  final TextEditingController _carbohydrateTextEditingController =
      TextEditingController();
  final TextEditingController _fatTextEditingController =
      TextEditingController();
  final TextEditingController _proteinTextEditingController =
      TextEditingController();
  String _errorMessage = '';
  FoodCM? _initialFood;

  final doubleInputFormater =
      FilteringTextInputFormatter.allow(RegExp(r'^[0-9]{0,4}(\.[0-9]{0,1})?$'));
  final intInputFormater =
      FilteringTextInputFormatter.allow(RegExp(r'^[0-9]{0,4}$'));

  @override
  void initState() {
    _initialFood = widget.initalFood;
    if (_initialFood != FoodCM()) {
      _nameTextEditingController.text = _initialFood!.name!;

      _weightTextEditingController.text = _initialFood!.gramsPerUnit.toString();
      _calorieTextEditingController.text = widget.initalFood.calorie.toString();
      _carbohydrateTextEditingController.text =
          _initialFood!.macroNutrition.carbohydrate.toString();
      _fatTextEditingController.text =
          _initialFood!.macroNutrition.fat.toString();
      _proteinTextEditingController.text =
          _initialFood!.macroNutrition.protein.toString();
    } else {
      _nameTextEditingController.text =
          widget.initalName ?? _initialFood!.name!;

      _initialFood!.name = _nameTextEditingController.text;
    }

    super.initState();
  }

  @override
  void dispose() {
    _nameTextEditingController.dispose();
    _weightTextEditingController.dispose();
    _calorieTextEditingController.dispose();
    _carbohydrateTextEditingController.dispose();
    _fatTextEditingController.dispose();
    _proteinTextEditingController.dispose();
    super.dispose();
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required TextInputType textInputType,
    String? suffix,
    required Function(String) onChanged,
    int maxLength = 5,
    required TextInputFormatter textInputFormatter,
  }) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      maxLength: maxLength,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        suffix: suffix != null ? Text(suffix) : null,
        counterText: '',
      ),
      inputFormatters: [
        textInputFormatter,
      ],
      onTap: () {
        controller.selection =
            TextSelection(baseOffset: 0, extentOffset: controller.text.length);
      },
      onChanged: onChanged,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final title =
        widget.initalFood == FoodCM() ? 'اضافه کردن خوراک' : 'ویرایش خوراک';
    return BottomSheet(
      animationController: BottomSheet.createAnimationController(this),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: context.sizesExtenstion.medium,
          right: context.sizesExtenstion.medium,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Divider(
                height: context.sizesExtenstion.large,
              ),
              _buildTextField(
                controller: _nameTextEditingController,
                labelText: 'نام خوراکی',
                onChanged: (_) {
                  _initialFood!.name = _nameTextEditingController.text;
                },
                textInputFormatter:
                    FilteringTextInputFormatter.singleLineFormatter,
                textInputType: TextInputType.name,
                maxLength: 50,
              ),
              SizedBox(
                height: context.sizesExtenstion.small,
              ),
              _buildTextField(
                controller: _weightTextEditingController,
                labelText: 'وزن هر واحد متوسط',
                suffix: 'گرم',
                onChanged: (_) {
                  _initialFood!.gramsPerUnit =
                      _weightTextEditingController.text.isEmpty
                          ? 0
                          : int.parse(_weightTextEditingController.text);
                },
                textInputFormatter: intInputFormater,
                textInputType: const TextInputType.numberWithOptions(),
                maxLength: 4,
              ),
              SizedBox(
                height: context.sizesExtenstion.medium,
              ),
              const Text('مشخصات خوراک در هر واحد متوسط'),
              Divider(
                height: context.sizesExtenstion.large,
              ),

              SizedBox(
                height: context.sizesExtenstion.small,
              ),
              _buildTextField(
                controller: _calorieTextEditingController,
                labelText: 'انرژی',
                suffix: 'کیلوکالری',
                onChanged: (_) {
                  _initialFood!.calorie =
                      _calorieTextEditingController.text.isEmpty
                          ? 0
                          : int.parse(_calorieTextEditingController.text);
                },
                textInputFormatter: intInputFormater,
                textInputType: const TextInputType.numberWithOptions(),
                maxLength: 4,
              ),
              SizedBox(
                height: context.sizesExtenstion.medium,
              ),
              _buildTextField(
                controller: _carbohydrateTextEditingController,
                labelText: 'کربوهیدرات',
                suffix: 'گرم',
                onChanged: (_) {
                  final carbohydrate = _initialFood!.macroNutrition
                      .carbohydrate = _carbohydrateTextEditingController
                          .text.isEmpty
                      ? 0.0
                      : double.parse(_carbohydrateTextEditingController.text);
                  _initialFood!.macroNutrition.carbohydrate = carbohydrate;
                },
                textInputFormatter: doubleInputFormater,
                textInputType:
                    const TextInputType.numberWithOptions(decimal: true),
                maxLength: 5,
              ),
              SizedBox(
                height: context.sizesExtenstion.medium,
              ),
              _buildTextField(
                controller: _fatTextEditingController,
                labelText: 'چربی',
                suffix: 'گرم',
                onChanged: (_) {
                  final fat = _initialFood!.macroNutrition.fat =
                      _fatTextEditingController.text.isEmpty
                          ? 0.0
                          : double.parse(_fatTextEditingController.text);
                  _initialFood!.macroNutrition.fat = fat;
                },
                textInputFormatter: doubleInputFormater,
                textInputType:
                    const TextInputType.numberWithOptions(decimal: true),
                maxLength: 5,
              ),

              // text field for fats similar to proteins
              SizedBox(
                height: context.sizesExtenstion.medium,
              ),
              _buildTextField(
                controller: _proteinTextEditingController,
                labelText: 'پروتئین',
                suffix: 'گرم',
                onChanged: (_) {
                  final protein = _initialFood!.macroNutrition.protein =
                      _proteinTextEditingController.text.isEmpty
                          ? 0.0
                          : double.parse(_proteinTextEditingController.text);
                  _initialFood!.macroNutrition.protein = protein;
                },
                textInputFormatter: doubleInputFormater,
                textInputType:
                    const TextInputType.numberWithOptions(decimal: true),
                maxLength: 5,
              ),

              SizedBox(
                height: context.sizesExtenstion.medium,
              ),
              IsVegetableSegmentedButton(
                isSelected: _initialFood!.isVegetable!,
                onChange: (value) {
                  setState(() {
                    _initialFood!.isVegetable = value;
                  });
                },
              ),

              SizedBox(
                height: context.sizesExtenstion.medium,
              ),
              Text(
                _errorMessage,
                style: context.themeData.textTheme.bodySmall
                    ?.copyWith(color: context.themeData.colorScheme.error),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _errorMessage = '';
                  });
                  if (_initialFood?.calorie == null ||
                      _initialFood?.gramsPerUnit == null ||
                      _initialFood!.name!.isEmpty ||
                      _initialFood?.macroNutrition == null ||
                      _initialFood?.macroNutrition.carbohydrate == null ||
                      _initialFood?.macroNutrition.fat == null ||
                      _initialFood?.macroNutrition.protein == null) {
                    setState(() {
                      _errorMessage = 'همه فیلدها باید تکمیل شوند';
                    });
                    return;
                  } else {
                    // change nutrition value for 100 grams
                    if (_initialFood == null) {}
                    // final multiplier = 100 / _initialFood!.gramsPerUnit;
                    // _initialFood = _initialFood!.copyWith(
                    //     calorie: (_initialFood!.calorie * multiplier).toInt(),
                    //     macroNutrition: _initialFood!.macroNutrition.copyWith(
                    //       carbohydrate:
                    //           _initialFood!.macroNutrition.carbohydrate *
                    //               multiplier,
                    //       fat: _initialFood!.macroNutrition.fat * multiplier,
                    //       protein:
                    //           _initialFood!.macroNutrition.protein * multiplier,
                    //     ));
                    widget.onfoodUpdated?.call(_initialFood!);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('ذخیره'),
              ),
              SizedBox(
                height: context.sizesExtenstion.medium,
              ),
            ],
          ),
        ),
      ),
      onClosing: () {},
    );
  }
}

class IsVegetableSegmentedButton extends StatelessWidget {
  const IsVegetableSegmentedButton(
      {super.key, this.onChange, this.isSelected = false});
  final ValueSetter<bool>? onChange;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'سبزی و میوه است؟',
          style: context.themeData.textTheme.bodyMedium,
        ),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: ((context) {
                return SimpleDialog(
                  titlePadding: const EdgeInsets.all(16.0),
                  contentPadding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 16.0),
                  title: const Text('کدام کربوهیدرات را انتخاب کنم؟'),
                  children: [
                    const Text.rich(
                      TextSpan(text: ' میوه و سبزی مانند', children: [
                        TextSpan(
                          text: 'موز، سیب، کاهو و ...',
                        )
                      ]),
                    ),
                    SizedBox(
                      height: context.sizesExtenstion.medium,
                    ),
                    const Text.rich(
                      TextSpan(text: 'کربوهیدرات غنی مانند ', children: [
                        TextSpan(
                          text: 'جو، برنج، پاستا، سیب زمینی ، نان، حبوبات',
                        )
                      ]),
                    )
                  ],
                );
              }),
            );
          },
          icon: const Icon(Ionicons.information_circle_outline),
        ),
        const Spacer(),
        SegmentedButton<bool>(
          segments: const <ButtonSegment<bool>>[
            ButtonSegment<bool>(
              value: true,
              label: Text('بله'),
            ),
            ButtonSegment<bool>(
              value: false,
              label: Text('خیر'),
            ),
          ],
          selected: <bool>{isSelected},
          onSelectionChanged: (Set<bool> newSelection) {
            onChange?.call(newSelection.contains(true));
          },
        ),
      ],
    );
  }
}
