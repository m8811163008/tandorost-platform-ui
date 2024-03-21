import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:domain_model/domain_model.dart';

class UnitOfMusurementList extends StatefulWidget {
  const UnitOfMusurementList({
    super.key,
    this.list = const [],
    this.onSelected,
  });
  final List<UnitOfMeasurement> list;
  final ValueSetter<UnitOfMeasurement>? onSelected;

  @override
  State<UnitOfMusurementList> createState() => _UnitOfMusurementListState();
}

class _UnitOfMusurementListState extends State<UnitOfMusurementList> {
  late UnitOfMeasurement _selected;
  @override
  void initState() {
    // TODO select last selcted unit of measurement for last food logged
    _selected = widget.list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      primary: false,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      // cacheExtent: 150,
      children: List.generate(
        widget.list.length,
        (index) {
          final isSelected = _selected == widget.list[index];
          return CardUnitOfMesurmenntContent(
            unitOfMeasurement: widget.list[index],
            isSelected: isSelected,
            onSelected: !isSelected
                ? () {
                    final uom = widget.list[index];
                    setState(() {
                      _selected = uom;
                    });
                    widget.onSelected?.call(uom);
                  }
                : null,
          );
        },
      ),
    );
  }
}

class CardUnitOfMesurmenntContent extends StatelessWidget {
  const CardUnitOfMesurmenntContent({
    super.key,
    required this.unitOfMeasurement,
    this.isSelected = false,
    this.onSelected,
  });
  final UnitOfMeasurement unitOfMeasurement;
  final bool isSelected;
  final VoidCallback? onSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isSelected ? 4 : 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onSelected,
        child: UnitOfMesurmenntContent(
          unitOfMeasurement: unitOfMeasurement,
          isSelected: isSelected,
        ),
      ),
    );
  }
}

class UnitOfMesurmenntContent extends StatelessWidget {
  const UnitOfMesurmenntContent({
    super.key,
    required this.unitOfMeasurement,
    this.isSelected = false,
  });
  final UnitOfMeasurement unitOfMeasurement;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: size.biggest.height * 2 / 3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.directional(
                    top: 0.0,
                    start: 0.0,
                    textDirection: Directionality.of(context),
                    child: Opacity(
                      opacity: isSelected ? 0.3 : 0.2,
                      child: Icon(
                        unitOfMeasurement.icon,
                        size: 48,
                        color: isSelected
                            ? context.themeData.colorScheme.primary
                            : null,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                        context.l10n.unitOfMeasurementTitle(
                            unitOfMeasurement.type.name),
                        textAlign: TextAlign.center,
                        style: context.themeData.textTheme.bodyMedium),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.biggest.height / 3,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    _howManyGramsLabel(context),
                    style: context.themeData.textTheme.labelSmall,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  String _howManyGramsLabel(BuildContext context) {
    return unitOfMeasurement.howManyGrams != null
        ? '${unitOfMeasurement.howManyGrams} ${context.l10n.uomCardHomanyGramsLable}'
        : '⚡';
  }
}
