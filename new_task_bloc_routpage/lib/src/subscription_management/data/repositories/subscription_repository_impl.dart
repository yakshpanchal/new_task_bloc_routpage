// lib/data/repositories/subscription_repository_impl.dart

import 'package:injectable/injectable.dart';

import '../../business/entities/subscription_plan_entity.dart';
import '../../business/entities/subscription_role.dart';
import '../../business/entities/user_role.dart';
import '../../business/repositories/subscription_repository.dart';
import '../../business/usecases/subscription_usecase.dart';
import '../sources/local_data_source.dart';
import '../sources/remote_data_source.dart';

abstract class SubscriptionRepository {
  List<SubscriptionRole> getSubscriptionRoles();
}

// class SubscriptionRepositoryImpl extends SubscriptionRepository {
//   final RemoteDataSource remoteDataSource;
//   final LocalDataSource localDataSource;

//   SubscriptionRepositoryImpl(
//       {required this.remoteDataSource, required this.localDataSource});

//   @override
//   SubscriptionPlanEntity getSubscriptionPlanByRole(String userRole) {
//     // Implement logic to fetch subscription plan data from remote or local data sources
//     return SubscriptionPlanEntity(
//         // initialize with appropriate values
//         );
//   }
// }

// lib/data/repositories/subscription_repository_impl.dart

@LazySingleton(as: SubscriptionRepository)
class SubscriptionRepositoryImpl implements SubscriptionRepository {
  @override
  List<SubscriptionRole> getSubscriptionRoles() {
    // Implement logic to fetch subscription roles and plans from a data source (e.g., database, API)
    return [
      SubscriptionRole(
        userRole: UserRole.owner,
        plans: [
          SubscriptionPlanEntity(
            planId: '1',
            planName: 'Free Plan',
            description: 'Basic plan for owners',
            price: 0.0,
            duration: '90 days', // (monthly, yearly, etc.)
            maximumNumberofListings: 0,
            featuredListingsQuota: 0,
            priorityCustomerSupport: false,
            advancedAnalyticsAccess: false,
            discountOnBookingFees: 10,
          ),
          SubscriptionPlanEntity(
            planId: '2',
            planName: 'Premium Plan',
            description: 'Advanced plan for owners',
            price: 19.99,
            duration: '90 days', // (monthly, yearly, etc.)
            maximumNumberofListings: 3,
            featuredListingsQuota: 2,
            priorityCustomerSupport: true,
            advancedAnalyticsAccess: true,
            discountOnBookingFees: 10,
          ),
        ],
      ),
      // Add roles and plans for other user roles
    ];
  }
}


// lib/core/repositories/subscription_repository.dart


