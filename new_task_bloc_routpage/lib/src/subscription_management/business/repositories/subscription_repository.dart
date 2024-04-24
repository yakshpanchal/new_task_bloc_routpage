// lib/core/repositories/subscription_repository.dart

import '../entities/subscription_plan_entity.dart';

abstract class SubscriptionRepository {
  SubscriptionPlanEntity getSubscriptionPlanByRole(String userRole);
}
