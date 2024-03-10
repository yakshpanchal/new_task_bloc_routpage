import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> propertyData;

  const DetailPage({Key? key, required this.propertyData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Property Details'),
      ),
      body: Column(
        children: [
          Text('Category: ${propertyData['category']}'),
          Text('Type: ${propertyData['type']}'),
          Text('Transaction Type: ${propertyData['transactionType']}'),
          // Add more details as needed
        ],
      ),
    );
  }
}
