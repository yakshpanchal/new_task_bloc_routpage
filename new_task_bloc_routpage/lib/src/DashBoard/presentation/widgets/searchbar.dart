import 'package:flutter/material.dart';
import 'package:new_task_bloc_routpage/config/Common/Widgets/Common.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    String searchText = '';
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Search here...',
            ),
            onChanged: (value) {
              searchText = value;
            },
          ),
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            if (searchText.isEmpty) {
              // If search text is empty, show an error message
              Common.showErrorDialog(context, 'Enter to search.');
            } else {
              // Perform search operation
              // Add your search logic here
              print('you Search text: $searchText');
            }
          },
        ),
      ],
    );
  }
}
