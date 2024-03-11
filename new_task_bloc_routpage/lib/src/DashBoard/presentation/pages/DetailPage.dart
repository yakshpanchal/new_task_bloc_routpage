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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      const TextSpan(
                        text: 'Country: ',
                        style: TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                          color: Colors.black,
                          // Add other desired styles for the label
                        ),
                      ),
                      TextSpan(
                        text: '${propertyData['country']}',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Property Type: ${propertyData['type']}'),
                const SizedBox(
                  height: 10,
                ),
                Text('Want Property For : ${propertyData['transactionType']}'),
                const SizedBox(
                  height: 10,
                ),
                Text('state: ${propertyData['state']}'),
                const SizedBox(
                  height: 10,
                ),
                Text('City: ${propertyData['city']}'),
                const SizedBox(
                  height: 10,
                ),
                Text('Transaction Type: ${propertyData['transactionType']}'),
                const SizedBox(
                  height: 10,
                ),
                Text('Your Price Range : ${propertyData['maxPrice']}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
