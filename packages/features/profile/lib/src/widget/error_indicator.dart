import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/src/initialize_profile_wizard/cubit/initialize_user_cubit.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator(
      {super.key, required this.child, required this.selector});
  final Widget child;

  /// A method that  returns true  when isError is true.
  final bool Function(InitializeUserState) selector;
  @override
  Widget build(BuildContext context) {
    return BlocSelector<InitializeUserCubit, InitializeUserState, bool>(
      selector: selector,
      builder: (context, isError) {
        return Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
              side: isError
                  ? BorderSide(
                      width: isError ? 3 : 0,
                      color: context.themeData.colorScheme.error)
                  : BorderSide.none),
          child: child,
        );
      },
    );
  }
}
