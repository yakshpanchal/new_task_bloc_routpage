// ignore_for_file: use_key_in_widget_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_task_bloc_routpage/src/subscription_management/presentation/pages/payment_method_screen.dart';
// import 'package:iq/features/subscription_management/presentation/pages/payment_method_screen.dart';

// Import other necessary packages

class SubscriptionPlanDetails extends StatelessWidget {
  const SubscriptionPlanDetails({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              "assets/images/diamond.png",
              height: 35,
              width: 35,
            ),
            const Text(
              "Subscription plans",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFF263A43),
              ),
            ),
            Image.asset(
              "assets/images/diamond.png",
              height: 35,
              width: 35,
            ),
          ],
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Join Now for Exclusive Offers and \n                       Rewards",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF263A43),
              ),
            ),
          ),
          Container(
              child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              scrollDirection: Axis.vertical,
              autoPlay: true,
            ),
            items: List.empty(),
          )),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/ConeLeft.png",
                height: 15,
                width: 15,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Plans Benefits",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF35343F),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/images/ConeRight.png",
                height: 15,
                width: 15,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cardData.length,
              itemBuilder: (context, index) {
                return MyCard(
                  heading: cardData[index]['heading'],
                  points: List<Map<String, dynamic>>.from(
                      cardData[index]['points']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final String heading;
  final List<Map<String, dynamic>> points;

  const MyCard({Key? key, required this.heading, required this.points})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            tileColor: const Color(0xFFF0F0F0),
            title: Center(
              child: Text(
                heading,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var point in points)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 8.0),
                      point['isCompleted']
                          ? const Icon(Icons.check,
                              size: 18.0, color: Colors.green)
                          : const Icon(Icons.close,
                              size: 18.0, color: Colors.red),
                      const SizedBox(width: 8.0),
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: Text(
                          point['text'].toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: point['isCompleted']
                                ? const Color(0xFF35343F)
                                : const Color(0xFF848788),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PaymentMethod(),
              ));
            },
            child: Container(
              height: 20,
              width: 20,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> cardData = [
  {
    'heading': 'Privacy & Alerts',
    'points': [
      {'text': 'Instant Property Alerts on Views', 'isCompleted': true},
      {'text': 'Mobile Number Privacy', 'isCompleted': true},
      {'text': 'Priority Customer Care', 'isCompleted': false},
    ]
  },
  {
    'heading': 'Assistance',
    'points': [
      {'text': 'Dedicated Relationship Manager', 'isCompleted': true},
      {'text': 'Rent Negotiation', 'isCompleted': true},
      {'text': 'Rental agreement home delivered', 'isCompleted': false},
      {'text': 'Showing Property on your behalf', 'isCompleted': true},
    ]
  },
  {
    'heading': 'Social Media Promotions',
    'points': [
      {'text': 'Photoshoot of your property', 'isCompleted': true},
      {'text': 'Large Photos & Slideshows', 'isCompleted': true},
      {
        'text': 'Direct property promotion to Tenants & Buyers',
        'isCompleted': false
      },
    ]
  },
];
