// lib/presentation/controllers/subscription_controller.dart
// lib/presentation/controllers/subscription_controller.dart

import '../../business/entities/subscription_plan_entity.dart';
import '../../business/usecases/subscription_usecase.dart';

import '../../business/entities/user_role.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// class SubscriptionController {
//   final SubscriptionUseCase _subscriptionUseCase;

//   SubscriptionController(this._subscriptionUseCase);

//   SubscriptionPlanEntity getSubscriptionPlan(String userRole) {
//     return _subscriptionUseCase.getSubscriptionPlan(userRole);
//   }
// }

// class SubscriptionController {
//   final SubscriptionUseCase _subscriptionUseCase;

//   SubscriptionController(this._subscriptionUseCase);

//   List<SubscriptionPlanEntity> getSubscriptionPlans(UserRole userRole) {
//     return _subscriptionUseCase.getSubscriptionPlans(userRole);
//   }
// }

// class SubscriptionState {}

// class SubscriptionController extends Cubit<SubscriptionState> {
//   final SubscriptionUseCase _subscriptionUseCase;

//   SubscriptionController(this._subscriptionUseCase)
//       : super(SubscriptionState());

//   List<SubscriptionPlanEntity> getSubscriptionPlans(UserRole userRole) {
//     return _subscriptionUseCase.getSubscriptionPlans(userRole);
//   }
// }
