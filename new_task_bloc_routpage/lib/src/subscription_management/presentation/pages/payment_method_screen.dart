import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:new_task_bloc_routpage/src/subscription_management/presentation/widgets/CongratulationScreen.dart';
import 'package:new_task_bloc_routpage/src/subscription_management/presentation/widgets/Info.dart';
import 'package:new_task_bloc_routpage/src/subscription_management/presentation/widgets/PaymentFailed.dart';

// import 'package:iq/features/subscription_management/presentation/widgets/CongratulationScreen.dart';
// import 'package:iq/features/subscription_management/presentation/widgets/Info.dart';
// import 'package:iq/features/subscription_management/presentation/widgets/PaymentFailed.dart';
@RoutePage()
class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Select your payment method',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/Payment/Bhim.png',
                  height: 25,
                  width: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "UPI / QR",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0x40000000))),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Image.asset(
                      "assets/images/Payment/PaytmLogo.png",
                      width: 40,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0x40000000))),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Image.asset(
                      "assets/images/Payment/Google.png",
                      width: 40,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0x40000000))),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Image.asset(
                      "assets/images/Payment/PhonepeLogo.png",
                      width: 40,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 2,
              width: double.infinity,
              color: const Color(0xFFBEBEBE),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/Payment/Wallet.png',
                  height: 25,
                  width: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Wallet",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0x40000000))),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Image.asset(
                      "assets/images/Payment/AmazonPay.png",
                      width: 40,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0x40000000))),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Image.asset(
                      "assets/images/Payment/MobiKwik.png",
                      width: 40,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0x40000000))),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Image.asset(
                      "assets/images/Payment/Phonepe.png",
                      width: 40,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 2,
              width: double.infinity,
              color: const Color(0xFFBEBEBE),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Plan Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 2,
              width: double.infinity,
              color: const Color(0xFFBEBEBE),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text(
                  "3 Months Premium Plan ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  "₹ $PremiumPlan",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              width: double.infinity,
              color: const Color(0xFFBEBEBE),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  "Redeem points - (₹100 Discount)",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF5480AA)),
                ),
                const Spacer(),
                Text(
                  "₹ $Discount",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF5480AA)),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              width: double.infinity,
              color: const Color(0xFFBEBEBE),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text(
                  "Total Cost ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Text(
                  "₹ $TotalCost",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PaymentFailed(),
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF263A43),
                    borderRadius: BorderRadius.circular(25)),
                height: 50,
                width: double.infinity,
                child: const Center(
                  child: Text(
                    "Payment failed",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            GestureDetector(
              onTap: () {
                // Navigate to CongratulationScreen after 5 seconds

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const CongratulationScreen(),
                  ),
                );

                Future.delayed(Duration.zero, () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialog(
                        actions: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 70,
                                color: Colors.green,
                              ),
                              Center(
                                child: Text(
                                  "₹ 5399",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Payment Confirmed!!!",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Thank you, your payment has been",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF797878),
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "successful",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF797878),
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  );
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF263A43),
                    borderRadius: BorderRadius.circular(25)),
                height: 50,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Pay ₹ $TotalCost",
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
