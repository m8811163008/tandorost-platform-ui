enum SubscriptionPlan {
  oneMonth(35),
  threeMonth(100);

  const SubscriptionPlan(this.durationInDays);

  final int durationInDays;
}
