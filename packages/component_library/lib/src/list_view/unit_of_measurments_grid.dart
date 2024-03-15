import 'package:component_library/component_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/widgets.dart';

class UnitOfMusurementList extends StatelessWidget {
  const UnitOfMusurementList({
    super.key,
    this.list = const [],
  });
  final List<UnitOfMeasurement> list;

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
          list.length,
          (index) => Card(
            child: UnitOfMesurmenntContent(
              unitOfMeasurement: list[index],
            ),
          ),
        ),
      ),
    );
  }
}

class UnitOfMesurmenntContent extends StatelessWidget {
  const UnitOfMesurmenntContent({super.key, required this.unitOfMeasurement});
  final UnitOfMeasurement unitOfMeasurement;

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
                      opacity: 0.2,
                      child: Icon(
                        unitOfMeasurement.icon,
                        size: 64,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      unitOfMeasurement.title,
                    ),
                  ),
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
