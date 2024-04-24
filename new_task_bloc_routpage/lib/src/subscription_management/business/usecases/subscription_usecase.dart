// lib/core/usecases/subscription_usecase.dart

import 'package:get_it/get_it.dart';

import '../entities/subscription_plan_entity.dart';
import '../entities/subscription_role.dart';
import '../entities/user_role.dart';
import '../repositories/subscription_repository.dart';


// class SubscriptionUseCase {
//   final SubscriptionRepository _subscriptionRepository;

//   SubscriptionUseCase(this._subscriptionRepository);

//   SubscriptionPlanEntity getSubscriptionPlan(UserRole userRole) {
//     // Implement logic to fetch the appropriate subscription plan based on user role
//     switch (userRole) {
//       case UserRole.owner:
//         return _subscriptionRepository.getSubscriptionPlanByRoleAndCategory(
//             'owner', 'free');
//       case UserRole.tenant:
//         return _subscriptionRepository.getSubscriptionPlanByRoleAndCategory(
//             'tenant', 'comfort');
//       case UserRole.buyer:
//         return _subscriptionRepository.getSubscriptionPlanByRoleAndCategory(
//             'buyer', 'premium');
//       case UserRole.seller:
//         return _subscriptionRepository.getSubscriptionPlanByRoleAndCategory(
//             'seller', 'comfort_plus');
//       case UserRole.dealer:
//         return _subscriptionRepository.getSubscriptionPlanByRoleAndCategory(
//             'dealer', 'premium_plus');
//       default:
//         throw Exception("Unsupported user role");
//     }
//   }
// }

//
// lib/core/usecases/subscription_usecase.dart

abstract class SubscriptionRepository {
  List<SubscriptionRole> getSubscriptionRoles();
}


class SubscriptionUseCase {
  // final SubscriptionRepository _repository;
  // SubscriptionUseCase(this._repository);

  final SubscriptionRepository _repository = GetIt.I<SubscriptionRepository>();
//GetIt - Very simple and easy to use service locator
//You register your object creation factory
//or
//an instance of an object with [registerFactory], [registerSingleton]
//or
//[registerLazySingleton]
//And retrieve the desired object using [get]
//or
//call your locator as function as its a callable class
//Additionally  GetIt offers asynchronous creation functions
//as well as functions to
//synchronize the async initialization of multiple Singletons

  List<SubscriptionRole> getSubscriptionRoles() {
    return _repository.getSubscriptionRoles();
  }

  List<SubscriptionPlanEntity> getSubscriptionPlans(UserRole userRole) {
    final roles = getSubscriptionRoles();
    final matchingRole = roles.firstWhere(
      (role) => role.userRole == userRole,
      orElse: () => throw Exception("Unsupported user role"),
    );

    return matchingRole.plans;
  }
}
