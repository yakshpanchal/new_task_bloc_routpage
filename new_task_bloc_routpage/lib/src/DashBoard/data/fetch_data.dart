import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_task_bloc_routpage/src/DashBoard/presentation/pages/DetailPage.dart';

class FetchAvilablePropertys extends StatelessWidget {
  const FetchAvilablePropertys({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: StreamBuilder(
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
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of items per row
            crossAxisSpacing: 10, // Spacing between each item horizontally
            mainAxisSpacing: 10, // Spacing between each row vertically
          ),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var data =
                snapshot.data!.docs[index].data() as Map<String, dynamic>;
            String category = data['category'];
            String imagePath = _getImagePathForCategory(category);
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(propertyData: data),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      // height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black, // Choose your border color
                          width: 2, // Adjust the border width as needed
                        ),
                      ),
                      child: Image.asset(
                        imagePath, // Replace 'assets/image.jpg' with your actual asset path
                        fit: BoxFit.cover, // Adjust the fit as needed
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.black.withOpacity(
                            0.5), // Semi-transparent black background for better readability
                        child: Text(
                          '${data['category']} , ${data['type']} , ${data['transactionType']}',
                          style: const TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 16, // Adjust font size as needed
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ));
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
      // Add more cases for other categories
      default:
        return 'assets/images/default_image.jpg';
    }
  }
}
