import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:new_task_bloc_routpage/src/DashBoard/data/ShowRecommendedProperties.dart';
import 'package:new_task_bloc_routpage/src/DashBoard/data/fetch_data.dart';
import 'package:new_task_bloc_routpage/src/DashBoard/presentation/widgets/searchbar.dart';
import 'package:new_task_bloc_routpage/src/DashBoard/presentation/widgets/tenantViewSwitch.dart';
import 'package:new_task_bloc_routpage/src/PropertyRequest/data/data-Source/SeprateData.dart';

@RoutePage()
class DashBoard extends StatefulWidget {
  const DashBoard({super.key});
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool _switchValue = false;
  int _selectedCategoryIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Rentl',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.deepPurple,
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

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  SatprateData.categories.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FilterChip(
                      label: Text(SatprateData.categories[index].name),
                      selected: _selectedCategoryIndex == index,
                      onSelected: (bool value) {
                        setState(() {
                          _selectedCategoryIndex = value ? index : -1;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recommended Properties',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
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
            const Text(
              'Explore More Propertys',
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const FetchAvilablePropertys(),
          ],
        ),
      ),
    );
  }
}
