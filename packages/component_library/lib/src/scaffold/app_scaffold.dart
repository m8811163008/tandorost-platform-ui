import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, this.child, this.actions = const []});
  final Widget? child;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        actions: actions
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: e,
                ))
            .toList(),
      ),
      body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: context.sizesExtenstion.medium),
          child: child),
    );
  }
}
