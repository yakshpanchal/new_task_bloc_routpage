import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_task_bloc_routpage/config/Common/Widgets/Appbar.dart';
import 'package:new_task_bloc_routpage/src/FilterPropertyPage/presentation/widgets/CustomToggleFilterbar.dart';

@RoutePage()
class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // Define a list of filter options
  List<String> filters = ['Rent', 'Lease', 'Buy', 'Sell'];
  // Define a list to keep track of the selected filter
  List<bool> isSelected = [];

  @override
  void initState() {
    super.initState();
    // Initialize isSelected list with false values
    isSelected = List<bool>.filled(filters.length, false);
    // Select the first filter by default
    isSelected[0] = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Filter',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CustomFilterBar(
                // Using FilterBar widget
                filters: filters,
                isSelected: isSelected,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
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
                      if (snapshot.data == null ||
                          snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                child: Image.asset(
                                    'assets/images/delete_icon.png'),
                              ),
                              const Text('No Data Available'),
                            ],
                          ),
                        );
                      }
                      // Filtered properties based on selected filter
                      final filteredProperties =
                          snapshot.data!.docs.where((doc) {
                        var data = doc.data() as Map<String, dynamic>;
                        return data['transactionType'] ==
                            filters[isSelected.indexOf(true)];
                      }).toList();
                      // If no properties match the filter, show a message
                      if (filteredProperties.isEmpty) {
                        return Center(
                          child: const Text(
                              'No Properties Available for Selected Filter'),
                        );
                      }
                      // Show filtered properties
                      return Column(
                        children: filteredProperties.map((doc) {
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
                                      child: Row(
                                        children: [
                                          Container(
                                            width:
                                                200, // Adjust the width of the image container according to your needs
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
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
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
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      icon: const SizedBox(
                                                          width: 25,
                                                          height: 25,
                                                          child: Icon(
                                                              Icons.phone)),
                                                      onPressed: () {
                                                        // Handle contact button press
                                                      },
                                                    ),
                                                    IconButton(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      icon: SizedBox(
                                                        width: 25,
                                                        height: 25,
                                                        child: Image.asset(
                                                            'assets/images/WhatsApp.png'),
                                                      ),
                                                      onPressed: () {
                                                        // Handle contact button press
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
            ),
          ],
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
      default:
        return 'assets/images/default_image.jpg';
    }
  }
}
