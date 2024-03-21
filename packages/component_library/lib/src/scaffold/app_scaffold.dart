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
        actions: actions,
      ),
      body: Padding(
        padding: EdgeInsets.all(context.sizesExtenstion.medium),
        child: child,
      ),
    );
  }
}
