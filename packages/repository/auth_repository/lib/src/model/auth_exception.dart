import 'package:domain_model/domain_model.dart';

/// Auth exception when user disconnect and
class AuthException implements Exception {
  const AuthException();
}

/// User cancled and maybe did not logged in.
class UserCancledException implements Exception {
  const UserCancledException();
}

/// Bazzar did not install on user device.
class NotInstalledException implements Exception {
  const NotInstalledException();
}

/// User did not login to bazzar.
class UserNotLogedInException implements Exception {
  const UserNotLogedInException();
}

extension SubscriptionPlanX on SubscriptionPlan {
  String get sku => switch (this) {
        SubscriptionPlan.oneMonth => 'BkG5O0V8ST0RIrEMJSzT',
        SubscriptionPlan.threeMonth => 'Qdtw5MzkQwBpFZl3T43g',
        _ => throw Exception('Unknown'),
      };
}
