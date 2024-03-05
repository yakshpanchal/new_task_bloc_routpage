import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

@RoutePage()
class ShowUserRequest extends StatefulWidget {
  const ShowUserRequest({Key? key}) : super(key: key);

  @override
  State<ShowUserRequest> createState() => _ShowUserRequestState();
}

class _ShowUserRequestState extends State<ShowUserRequest> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Property Requests ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(auth.currentUser!.uid)
            .collection('propertyrequests')
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
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var data =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              return Card(
                child: Stack(
                  children: [
                    ListTile(
                      title: Text('Category: ${data['category']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Property Type: ${data['type']}'),
                          Text(
                              'Want Property For : ${data['transactionType']}'),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                const TextSpan(
                                  text: 'Country: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    // Add other desired styles for the label
                                  ),
                                ),
                                TextSpan(
                                  text: '${data['country']}',
                                  style: const TextStyle(
                                      // Add desired styles for the value
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Text('state: ${data['state']}'),
                          Text('City: ${data['city']}'),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              'Your Price Range : ${data['minPrice']} to ${data['maxPrice']}'),
                          Row(
                            children: [
                              const Text('Contact with Mobile :  '),
                              data['contactMobile']
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    )
                                  : const Icon(Icons.close, color: Colors.red),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Contact with WhatsApp :  '),
                              data['contactWhatsApp']
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    )
                                  : const Icon(Icons.close, color: Colors.red),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _deleteRequest(snapshot.data!.docs[index].id);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _deleteRequest(String requestId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('propertyrequests')
          .doc(requestId)
          .delete();
    } catch (error) {
      print('Failed to delete request: $error');
    }
  }
}
