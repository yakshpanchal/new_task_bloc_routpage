import 'package:flutter/material.dart';
import '../pages/subscription_plan_details.dart';

class PaymentFailed extends StatelessWidget {
  const PaymentFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.cancel,
              size: 70,
              color: Colors.red,
            ),
            const Center(
              child: Text(
                "₹ 5399",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Payment failed!!!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Your payment has been unsuccessful",
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF797878),
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SubscriptionPlanDetails(),
                ));
              },
              child: Container(
                height: 50,
                width: 340,
                color: Colors.amber,
                child: const Center(
                  child: Text(
                    "Retry",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
