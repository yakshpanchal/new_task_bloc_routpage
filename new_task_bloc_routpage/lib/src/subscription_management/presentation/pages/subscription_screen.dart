import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:new_task_bloc_routpage/src/subscription_management/presentation/pages/subscription_plan_list.dart';
// import 'package:iq/features/subscription_management/presentation/pages/subscription_plan_list.dart';
// import 'package:iq/features/bottom_navigation_bar_management/presentation/temp/bottomnavigationbar.dart';

@RoutePage()
class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Subscription Plans',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          // leading: IconButton(
          //   icon: const Icon(
          //     Icons.arrow_back,
          //     color: Colors.black,
          //     size: 30,
          //   ),
          //   onPressed: () {
          //     Navigator.of(context)
          //         .pop(); // Navigate back when the icon is pressed
          //   },
          // ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            childAspectRatio: 1.3, // Adjust the aspect ratio to control width
          ),
          itemCount: 5, // Number of cards
          itemBuilder: (context, index) {
            final subscriptionPlans = [
              'Owner’s \nSubscription \nPlan',
              'Tenant \nSubscription \nPlan',
              'Buyer’s\nSubscription \nPlan',
              'Seller \nSubscription \nPlan',
              'Dealer \nSubscription \nPlan',
            ];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OwnerScreen(),
                ));
              },
              child: Card(
                color: const Color(0xFFF5F6FB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.all(10),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 10),
                        child: Text(
                          subscriptionPlans[index],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF35343F),
                          ),
                        ),
                      ),
                      Icon(Icons.diamond_outlined),
                      // Image.asset(
                      //   "assets/images/diamond.png",
                      //   height: 30,
                      //   width: 30,
                      // )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        //bottomNavigationBar: const TenantsViewNavigationBar(),
      ),
    );
  }
}
