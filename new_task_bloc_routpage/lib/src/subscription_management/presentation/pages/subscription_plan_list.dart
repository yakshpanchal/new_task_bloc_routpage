import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:new_task_bloc_routpage/src/subscription_management/presentation/widgets/Info.dart';
// import 'package:iq/features/subscription_management/presentation/widgets/Info.dart';
// import 'package:iq/features/bottom_navigation_bar_management/presentation/temp/bottomnavigationbar.dart';

import 'subscription_plan_details.dart';

@RoutePage()
class OwnerScreen extends StatelessWidget {
  const OwnerScreen({super.key, Key? context});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Owner’s Subscription Plans',
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
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: PriceInfo1.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 240,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(color: const Color(0xFF36515B))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: 80,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Align(
                                                alignment: Alignment.topCenter,
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                    text: PriceInfo1[index],
                                                    style: const TextStyle(
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: PriceInfo2[index],
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                    ),
                                                  )
                                                ]))),
                                            const Spacer(),
                                            const Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 28),
                                                  child: Text(
                                                    "3x more Visibility",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xFF616161),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: -8,
                                    left: 95,
                                    child: Container(
                                      height: 25,
                                      width: 170,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Color(0xFFD9D9D9)),
                                      child: Center(
                                          child: Text(
                                        PlanInformation[index],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 28,
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 28,
                                      width: 15,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomRight:
                                                  Radius.circular(20))),
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Positioned(
                                            right: 5,
                                            child: Container(
                                                height: 27,
                                                width: 18,
                                                decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)))),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Positioned(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 13),
                                        child: Text(
                                          "3x more Visibility \n ",
                                          style: TextStyle(
                                            color: Color(0xFF616161),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: 28,
                                      width: 18,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              bottomLeft: Radius.circular(20))),
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Positioned(
                                            right: -5,
                                            child: Container(
                                                height: 26,
                                                width: 18,
                                                decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(20),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20)))),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 28),
                                child: Text(
                                  "5000 Facebook/Instagram Impressions",
                                  style: TextStyle(
                                    color: Color(0xFF616161),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          const SubscriptionPlanDetails(),
                                    ));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF263A43),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 45,
                                    width: 300,
                                    child: Center(
                                      child: Text(
                                        "Buy ${PlanInformation[index]}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        //bottomNavigationBar: const TenantsViewNavigationBar(),
      ),
    );
  }
}
