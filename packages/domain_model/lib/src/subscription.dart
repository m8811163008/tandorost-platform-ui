enum SubscriptionPlan {
  free(0),
  oneMonth(35),
  oneMonthCashPayment(35),
  threeMonth(100);

  const SubscriptionPlan(this.durationInDays);

  final int durationInDays;
}
