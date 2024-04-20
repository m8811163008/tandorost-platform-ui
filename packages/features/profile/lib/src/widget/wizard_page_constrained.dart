import 'package:flutter/material.dart';

class WizardPageConstrained extends StatelessWidget {
  const WizardPageConstrained({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          // 56 is Appbar height
          minHeight: MediaQuery.of(context).size.height - 56,
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: IntrinsicHeight(
          child: child,
        ),
      ),
    );
  }
}
