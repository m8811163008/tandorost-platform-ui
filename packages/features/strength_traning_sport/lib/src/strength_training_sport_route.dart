import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

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
      child: Center(
        child: Text('hello'),
      ),
    );
  }
}
