import 'package:flutter/material.dart';
import 'package:new_task_bloc_routpage/src/subscription_management/presentation/widgets/Info.dart';
// import 'package:iq/features/subscription_management/presentation/widgets/Info.dart';
// import 'package:iq/features/bottom_navigation_bar_management/presentation/temp/bottomnavigationbar.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Subscription Plan',
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
          )),
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Contratulation!!!",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Image.asset(
                "assets/images/ConeRight.png",
                height: 20,
                width: 20,
              )
            ],
          ),
          const Text(
            "Your current plan details are",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          const SizedBox(
            height: 20,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                height: 250,
                width: 320,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "₹ $TotalCost",
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          "/60days",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const Text(
                      "3x more Visibility \n3x more Responses \n5000 Facebook / Instagram Impressions",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFF616161),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Plan Start :  31/10/2023",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF616161),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Plan Start :  31/10/2023",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF616161),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: -8,
                left: 80,
                child: Container(
                  height: 25,
                  width: 170,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xFFD9D9D9)),
                  child: const Center(
                      child: Text(
                    "Owner’s Premium plan",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  )),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 75,
              width: double.infinity,
              color: const Color(0xFFF0F0F0),
              child: const Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Go ahead and Post property",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 30,
                    color: Color(0xFF909196),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      //bottomNavigationBar: const TenantsViewNavigationBar(),
    );
  }
}

// onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => const PaymentFailed(),
//                 ));
//               },