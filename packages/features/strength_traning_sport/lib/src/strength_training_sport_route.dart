import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:strength_traning_sport/src/cubitw/strength_training_state.dart';
import 'package:url_launcher/url_launcher.dart';

class StrengthTrainingRoute extends StatelessWidget {
  const StrengthTrainingRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return StrengthTrainingView();
  }
}

class StrengthTrainingView extends StatelessWidget {
  const StrengthTrainingView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isShowDrawerButton: true,
      child: ListView(
        children: StrengthTraningProgram.strengthTrainingPrograms
            .map((e) => SportProgramTile(
                  imageNumber: StrengthTraningProgram.strengthTrainingPrograms
                          .indexOf(e) +
                      1,
                  label: e.label,
                  resourceUrl: e.resourceUrl,
                ))
            .toList(),
      ),
    );
  }
}

class SportProgramTile extends StatelessWidget {
  const SportProgramTile(
      {super.key,
      required this.imageNumber,
      required this.label,
      required this.resourceUrl});
  final String resourceUrl;
  final int imageNumber;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.4),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.6],
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
            ),
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(16.0),
              child: SportProgramImage(
                imageNumber: imageNumber,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final url = Uri.tryParse(resourceUrl);
                    if (url == null) return;
                    try {
                      await launchUrl(url);
                    } catch (_, __) {
                      print('object');
                    }
                  },
                  child: Text(
                    'دانلود',
                  ),
                ),
                SizedBox(
                  width: context.sizesExtenstion.medium,
                ),
                Flexible(
                  child: Text(
                    label,
                    textAlign: TextAlign.left,
                    style: context.themeData.textTheme.headlineSmall!.copyWith(
                      color: context.themeData.colorScheme.onSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
