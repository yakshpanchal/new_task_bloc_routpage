import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_task_bloc_routpage/config/router/router.gr.dart';
import 'package:new_task_bloc_routpage/src/PropertyRequest/data/data-Source/SeprateData.dart';

@RoutePage()
class PropertyRequest extends StatefulWidget {
  const PropertyRequest({super.key});
  @override
  State<PropertyRequest> createState() => _PropertyRequestState();
}

class _PropertyRequestState extends State<PropertyRequest> {
  int _selectedCategoryIndex = -1;
  int _selectedTypeIndex = -1;
  int _selecttransectionTypeIndex = -1;

  String? selectedCountry;
  String? selectedState;

  String? selectedCity;

  RangeValues _currentRangeValues =
      const RangeValues(0, 100000); // Initial range values
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isUploading = false;
  bool _isUploadingnewProperty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Property Request details',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          OutlinedButton.icon(
            onPressed: () {
              AutoRouter.of(context).push(const ShowUserRequest());
            },
            icon: const Icon(Icons.request_page, color: Colors.white),
            label: const Text(
              'See Your Request',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Property Category',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
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
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: double.infinity, // Adjust width according to your layout
                child: Divider(
                  color: Colors.grey, // Customize color as needed
                  thickness: 1.0, // Customize thickness as needed
                  height: 1.0, // Customize height as needed
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Select Property type',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    SatprateData.types.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: FilterChip(
                        label: Text(SatprateData.types[index].name),
                        selected: _selectedTypeIndex == index,
                        onSelected: (bool value) {
                          setState(() {
                            _selectedTypeIndex = value ? index : -1;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: double.infinity, // Adjust width according to your layout
                child: Divider(
                  color: Colors.grey, // Customize color as needed
                  thickness: 1.0, // Customize thickness as needed
                  height: 1.0, // Customize height as needed
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Select Transaction type',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    SatprateData.transactionTypes.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: FilterChip(
                        label: Text(SatprateData.transactionTypes[index].name),
                        selected: _selecttransectionTypeIndex == index,
                        onSelected: (bool value) {
                          setState(() {
                            _selecttransectionTypeIndex = value ? index : -1;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: double.infinity, // Adjust width according to your layout
                child: Divider(
                  color: Colors.grey, // Customize color as needed
                  thickness: 1.0, // Customize thickness as needed
                  height: 1.0, // Customize height as needed
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Select Price Range',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              RangeSlider(
                values: _currentRangeValues,
                min: 0,
                max: 1000000, // Adjust max value according to your requirement
                divisions: 100,
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Min: ₹${_currentRangeValues.start.round()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Max: ₹${_currentRangeValues.end.round()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: double.infinity, // Adjust width according to your layout
                child: Divider(
                  color: Colors.grey, // Customize color as needed
                  thickness: 1.0, // Customize thickness as needed
                  height: 1.0, // Customize height as needed
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Select Desire Location',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              CSCPicker(
                layout: Layout.vertical,
                // flagState: CountryFlag.DISABLE,
                onCityChanged: (city) {
                  setState(() {
                    selectedCity = city;
                  });
                },
                onCountryChanged: (country) {
                  setState(() {
                    selectedCountry = country;
                  });
                },
                onStateChanged: (state) {
                  setState(() {
                    selectedState = state;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: double.infinity, // Adjust width according to your layout
                child: Divider(
                  color: Colors.grey, // Customize color as needed
                  thickness: 1.0, // Customize thickness as needed
                  height: 1.0, // Customize height as needed
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Property Contact Preference',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked1,
                    onChanged: (value) {
                      setState(() {
                        _isChecked1 = value!;
                        // widget.onChanged1(value);
                      });
                    },
                  ),
                  const Text('Can Property Owners Contact You on Mobile ?'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked2,
                    onChanged: (value) {
                      setState(() {
                        _isChecked2 = value!;
                        // widget.onChanged2(value);
                      });
                    },
                  ),
                  const Text('Can Property Owners Contact on WhatsApp ?'),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: _isUploading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12), // Padding
                              ),
                            ),
                            onPressed: _submitPropertyRequest,
                            child: const Text('Submit Request'),
                          ),
                  ),
                  Container(
                    child: _isUploadingnewProperty
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green), // Background color
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white), // Text color
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12), // Padding
                              ),
                            ),
                            onPressed: _AddNewAvailableProperty,
                            child: const Text('Add New Property'),
                          ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  // submit button functions

  void _submitPropertyRequest() {
    // Check if any required field is not filled
    if (_selectedCategoryIndex == -1 ||
        _selectedTypeIndex == -1 ||
        _selecttransectionTypeIndex == -1 ||
        selectedCountry == null ||
        selectedState == null ||
        selectedCity == null) {
      // Show a snack bar indicating that all details are required
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all the details')),
      );
      return; // Exit the method without submitting the request
    }

    // Set the state to indicate that data upload is in progress
    setState(() {
      _isUploading = true;
    });

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Upload data to Firebase Firestore
    firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('propertyrequests')
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set({
      'category': SatprateData.categories[_selectedCategoryIndex].name,
      'type': SatprateData.types[_selectedTypeIndex].name,
      'transactionType':
          SatprateData.transactionTypes[_selecttransectionTypeIndex].name,
      'minPrice': _currentRangeValues.start.round(),
      'maxPrice': _currentRangeValues.end.round(),
      'country': selectedCountry,
      'state': selectedState,
      'city': selectedCity,
      'contactMobile': _isChecked1,
      'contactWhatsApp': _isChecked2,
      // Add more fields as needed
    }).then((_) {
      // Once upload is completed, set the state to indicate that upload is finished
      setState(() {
        _isUploading = false;
      });

      // Show a popup screen indicating successful submission
      _showSubmissionDialogAndClearForm(context);
    }).catchError((error) {
      // Handle errors
      print("Failed to submit property request: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to submit property request')),
      );

      // Reset the state to indicate that upload is finished (in case of error)
      setState(() {
        _isUploading = false;
      });
    });
  }

  // Define a method to show the submission dialog and clear the form
  void _showSubmissionDialogAndClearForm(BuildContext context) {
    // Show dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Submission Successful"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image from assets
              Image.asset(
                'assets/images/done.png', // Replace 'your_image.png' with your asset path
                width: 100, // Adjust the width as needed
                height: 100, // Adjust the height as needed
              ),
              const SizedBox(
                  height: 10), // Add some spacing between image and text
              const Text("Your request has been submitted successfully."),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Clear the form
                setState(() {
                  _selectedCategoryIndex = -1;
                  _selectedTypeIndex = -1;
                  _selecttransectionTypeIndex = -1;
                  _currentRangeValues = const RangeValues(0, 100000);
                  selectedCountry = null;
                  selectedState = null;
                  selectedCity = null;
                  _isChecked1 = false;
                  _isChecked2 = false;
                });
                // Dismiss the dialog
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _AddNewAvailableProperty() {
    // Check if any required field is not filled
    if (_selectedCategoryIndex == -1 ||
        _selectedTypeIndex == -1 ||
        _selecttransectionTypeIndex == -1 ||
        selectedCountry == null ||
        selectedState == null ||
        selectedCity == null) {
      // Show a snack bar indicating that all details are required
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all the details')),
      );
      return; // Exit the method without submitting the request
    }

    // Set the state to indicate that data upload is in progress
    setState(() {
      _isUploadingnewProperty = true;
    });

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Upload data to Firebase Firestore
    firestore
        .collection('AvailablePropertys')
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set({
      'category': SatprateData.categories[_selectedCategoryIndex].name,
      'type': SatprateData.types[_selectedTypeIndex].name,
      'transactionType':
          SatprateData.transactionTypes[_selecttransectionTypeIndex].name,
      'minPrice': _currentRangeValues.start.round(),
      'maxPrice': _currentRangeValues.end.round(),
      'country': selectedCountry,
      'state': selectedState,
      'city': selectedCity,
      'contactMobile': _isChecked1,
      'contactWhatsApp': _isChecked2,
      // Add more fields as needed
    }).then((_) {
      // Once upload is completed, set the state to indicate that upload is finished
      setState(() {
        _isUploadingnewProperty = false;
      });

      // Show a popup screen indicating successful submission
      _showSubmissionDialogAndClearForm(context);
    }).catchError((error) {
      // Handle errors
      print("Failed to submit property request: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to submit property request')),
      );

      // Reset the state to indicate that upload is finished (in case of error)
      setState(() {
        _isUploadingnewProperty = false;
      });
    });
  }
}
