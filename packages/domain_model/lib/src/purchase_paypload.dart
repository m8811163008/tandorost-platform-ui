import 'package:domain_model/src/subscription.dart';

class PurchasePayload {
  final SubscriptionPlan subscriptionPlan;

  const PurchasePayload({
    required this.subscriptionPlan,
  });
  Map<String, dynamic> toJson() => {
        'subscription_plan': subscriptionPlan.name,
      };

  factory PurchasePayload.fromJson(Map<String, dynamic> json) {
    return PurchasePayload(
        subscriptionPlan: SubscriptionPlan.values.singleWhere(
            (element) => element.name == json['subscription_plan']));
  }

  const PurchasePayload.empty() : subscriptionPlan = SubscriptionPlan.free;
}
