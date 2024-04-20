import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:domain_model/domain_model.dart';

class ActivityLevelsGrid extends StatefulWidget {
  const ActivityLevelsGrid(
      {super.key, this.onSelected, required this.initialValue});

  final ValueSetter<ActivityLevelCM>? onSelected;
  final ActivityLevelCM initialValue;

  @override
  State<ActivityLevelsGrid> createState() => _ActivityLevelsGridState();
}

class _ActivityLevelsGridState extends State<ActivityLevelsGrid> {
  late ActivityLevelCM _selected;
  @override
  void initState() {
    _selected = widget.initialValue;
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
        ActivityLevelCM.values.length,
        (index) {
          final isSelected = _selected == ActivityLevelCM.values[index];
          return CardActivityLevelContent(
            activityLevel: ActivityLevelCM.values[index],
            isSelected: isSelected,
            onSelected: !isSelected
                ? () {
                    final al = ActivityLevelCM.values[index];
                    setState(() {
                      _selected = al;
                    });
                    widget.onSelected?.call(al);
                  }
                : null,
          );
        },
      ),
    );
  }
}

class CardActivityLevelContent extends StatelessWidget {
  const CardActivityLevelContent({
    super.key,
    required this.activityLevel,
    this.isSelected = false,
    this.onSelected,
  });
  final ActivityLevelCM activityLevel;
  final bool isSelected;
  final VoidCallback? onSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isSelected ? 4 : 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onSelected,
        child: ActivityLevelContent(
          activityLevel: activityLevel,
          isSelected: isSelected,
        ),
      ),
    );
  }
}

class ActivityLevelContent extends StatelessWidget {
  const ActivityLevelContent({
    super.key,
    required this.activityLevel,
    this.isSelected = false,
  });
  final ActivityLevelCM activityLevel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                        Ionicons.ellipse_outline,
                        size: 48,
                        color: isSelected
                            ? context.themeData.colorScheme.primary
                            : null,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        context.l10n.profileActivityLevelButtonLabel(
                            activityLevel.name),
                        textAlign: TextAlign.start,
                        style: context.themeData.textTheme.bodyMedium,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
