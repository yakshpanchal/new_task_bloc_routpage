import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowRecommendedProperties extends StatelessWidget {
  const ShowRecommendedProperties({Key? key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // Adjust the height according to your needs
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('AvailablePropertys')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        child: Image.asset('assets/images/delete_icon.png'),
                      ),
                      const Text('No Data Available'),
                    ],
                  ),
                );
              }
              return Row(
                children: snapshot.data!.docs.map((doc) {
                  var data = doc.data() as Map<String, dynamic>;
                  String category = data['category'];
                  String imagePath = _getImagePathForCategory(category);
                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                              // width: 300,
                              child: Row(
                                children: [
                                  Container(
                                    width:
                                        150, // Adjust the width of the image container according to your needs
                                    height:
                                        150, // Adjust the height of the image container according to your needs
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          10), // Adjust the border radius according to your needs
                                      image: DecorationImage(
                                        image: AssetImage(imagePath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    // color: Colors.black.withOpacity(0.5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${data['category']}',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          '${data['type']}',
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          ' ${data['country']} , ',
                                          style: const TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                        Text(
                                          '${data['state']},',
                                          style: const TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                        Text(
                                          '${data['maxPrice']}/month',
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Positioned(
                          //   bottom: 0,
                          //   left: 0,
                          //   right: 0,
                          //   child: Container(
                          //     padding: const EdgeInsets.all(8),
                          //     color: Colors.black.withOpacity(0.5),
                          //     child: Text(
                          //       '${data['category']} , ${data['type']} , ${data['transactionType']} , ${data['country']} , ',
                          //       style: const TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 10,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  String _getImagePathForCategory(String category) {
    switch (category) {
      case 'Residential':
        return 'assets/Cetegory/home1.jpg';
      case 'PG':
        return 'assets/Cetegory/PG.jpeg';
      case 'Villa':
        return 'assets/Cetegory/Villa.jpeg';
      case 'Service Apartment':
        return 'assets/Cetegory/serviceapartment.jpeg';
      default:
        return 'assets/images/default_image.jpg';
    }
  }
}
