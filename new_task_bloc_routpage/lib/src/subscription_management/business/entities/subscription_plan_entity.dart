///
///
///
///Subscription Entity

class SubscriptionPlanEntity {
// Attributes:
  final String planId;
  final String planName;
  final String description;
  final double price;
  final String duration; // (monthly, yearly, etc.)
  final int maximumNumberofListings;
  final int featuredListingsQuota;
  final bool priorityCustomerSupport;
  final bool advancedAnalyticsAccess;
  final double discountOnBookingFees;

  SubscriptionPlanEntity({
    required this.planId,
    required this.planName,
    required this.description,
    required this.price,
    required this.duration, // (monthly, yearly, etc.)
    required this.maximumNumberofListings,
    required this.featuredListingsQuota,
    required this.priorityCustomerSupport,
    required this.advancedAnalyticsAccess,
    required this.discountOnBookingFees,
  });
}

//Retrieves the features included in the subscription plan.
//GetFeatures();
//Calculates the effective price considering any discounts or promotions.
//CalculateEffectivePrice();



