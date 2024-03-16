import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:domain_model/domain_model.dart';

class UnitOfMusurementList extends StatefulWidget {
  const UnitOfMusurementList({
    super.key,
    this.list = const [],
  });
  final List<UnitOfMeasurement> list;

  @override
  State<UnitOfMusurementList> createState() => _UnitOfMusurementListState();
}

class _UnitOfMusurementListState extends State<UnitOfMusurementList> {
  late UnitOfMeasurement _selected;
  @override
  void initState() {
    _selected = widget.list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(
        height: 180,
        width: 180,
      ),
      child: GridView.count(
        crossAxisCount: 2,
        primary: false,
        children: List.generate(
          widget.list.length,
          (index) {
            final isSelected = _selected == widget.list[index];
            return CardUnitOfMesurmenntContent(
              unitOfMeasurement: widget.list[index],
              isSelected: isSelected,
              onSelected: !isSelected
                  ? () {
                      setState(() {
                        _selected = widget.list[index];
                      });
                    }
                  : null,
            );
          },
        ),
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
                    child: Text(unitOfMeasurement.title,
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
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
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
