import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_task_bloc_routpage/src/DashBoard/data/ShowRecommendedProperties.dart';
import 'package:new_task_bloc_routpage/src/DashBoard/presentation/pages/DetailPage.dart';
import 'package:new_task_bloc_routpage/src/DashBoard/presentation/widgets/searchbar.dart';
import 'package:new_task_bloc_routpage/src/DashBoard/presentation/widgets/tenantViewSwitch.dart';

@RoutePage()
class DashBoard extends StatefulWidget {
  const DashBoard({super.key});
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool _switchValue = false;
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30.0), // Adjust the radius as needed
              bottomRight: Radius.circular(30.0), // Adjust the radius as needed
            ),
            child: AppBar(
              title: const Center(
                child: Text(
                  'Rentl',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 3,
                  ),
                ),
              ),
              backgroundColor: Color(0xFF1CB5B0),
              elevation:
                  0, // Optional: Set elevation to 0 if you don't want a shadow
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomSwitch(
                value: _switchValue,
                onChanged: (value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),
              // search field
              const CustomSearchField(),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text('Filter :'),
                  const SizedBox(
                    width: 10,
                  ),
                  DropdownButton<String>(
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                    value: _selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCategory = newValue!;
                      });
                    },
                    items: <String>[
                      'All',
                      'Residential',
                      'PG',
                      'Villa',
                      'Service Apartment'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recommended Properties',
                  style: TextStyle(
                      // color: Colors.deepPurple,
                      // fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const ShowRecommendedProperties(),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Explore More Propertys',
                  style: TextStyle(
                      // color: Colors.deepPurple,
                      // fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // FETCHING AVAILABELE PROPERTY DATA

              Expanded(
                child: StreamBuilder(
                  stream: _selectedCategory == 'All'
                      ? FirebaseFirestore.instance
                          .collection('AvailablePropertys')
                          .snapshots()
                      : FirebaseFirestore.instance
                          .collection('AvailablePropertys')
                          .where('category', isEqualTo: _selectedCategory)
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
                              child:
                                  Image.asset('assets/images/delete_icon.png'),
                            ),
                            const Text('No Data Available'),
                          ],
                        ),
                      );
                    }
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Number of items per row
                        crossAxisSpacing:
                            10, // Spacing between each item horizontally
                        mainAxisSpacing:
                            10, // Spacing between each row vertically
                      ),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data!.docs[index].data()
                            as Map<String, dynamic>;
                        String category = data['category'];
                        String imagePath = _getImagePathForCategory(category);
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(propertyData: data),
                              ),
                            );
                          },
                          child: Card(
                            // elevation: 4,
                            child: Stack(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  // height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        5), // Adjust the border radius according to your needs
                                    image: DecorationImage(
                                      image: AssetImage(imagePath),
                                      fit: BoxFit.cover,
                                    ),
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
                                        fontSize:
                                            10, // Adjust font size as needed
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
                ),
              ),
            ],
          ),
        ),
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
      // Add more cases for other categories
      default:
        return 'assets/images/default_image.jpg';
    }
  }
}
