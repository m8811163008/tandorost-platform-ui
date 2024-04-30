import 'package:component_library/src/helper.dart';
import 'package:domain_model/domain_model.dart';
import 'package:flutter/material.dart';

class UserRoleVisibility extends StatelessWidget {
  const UserRoleVisibility({
    super.key,
    required this.userRoleStream,
    this.dieterWidget,
    this.foodTrackerWidget,
  });

  final Stream<Set<UserRule>> userRoleStream;
  final Widget? foodTrackerWidget;
  final Widget? dieterWidget;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: userRoleStream,
      builder: (context, snapshot) {
        // todo handle auth status with snackbar
        if (snapshot.hasError)
          return Card(
            color: context.themeData.colorScheme.errorContainer,
            child: Padding(
              padding: EdgeInsets.all(context.sizesExtenstion.medium),
              child: Text(
                'اتصال به نرم افزار کافه بازار را بررسی کنید. ایا لاگین هستید؟آیا آخرین بروزرسانی را دارید؟',
                style: context.themeData.textTheme.bodyMedium!.copyWith(
                    color: context.themeData.colorScheme.onErrorContainer),
              ),
            ),
          );
        if (!snapshot.hasData) return SizedBox.shrink();
        final userRoles = snapshot.data!;
        if (userRoles.contains(UserRule.dieter) && dieterWidget != null) {
          return dieterWidget!;
        }

        if (userRoles.contains(UserRule.foodTracker) &&
            foodTrackerWidget != null) {
          return foodTrackerWidget!;
        }
        return SizedBox.shrink();
      },
    );
  }
}
