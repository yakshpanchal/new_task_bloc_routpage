// lib/core/entities/subscription_role.dart

// import 'package:iq/features/subscription_management/business/entities/user_role.dart';

import 'package:new_task_bloc_routpage/src/subscription_management/business/entities/user_role.dart';

import 'subscription_plan_entity.dart';

class SubscriptionRole {
  final UserRole userRole;
  final List<SubscriptionPlanEntity> plans;

  SubscriptionRole({
    required this.userRole,
    required this.plans,
  });
}
