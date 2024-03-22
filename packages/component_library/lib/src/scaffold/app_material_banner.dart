import 'package:flutter/material.dart';

class AppMaterialBanner extends MaterialBanner {
  const AppMaterialBanner._(
      {required super.content, required super.actions});

  factory AppMaterialBanner(
          {String text = '', List<Widget> actions = const []}) =>
      AppMaterialBanner._(
        actions: [
          if (actions.isEmpty) const AutoHideMaterialBanner(),
        ],
        content: Text(text),
      );
}

class AutoHideMaterialBanner extends StatelessWidget {
  const AutoHideMaterialBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          //auto hide scaffold messenger
          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
