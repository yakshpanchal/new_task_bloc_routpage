import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../config/Common/Widgets/CommonElevetedButton.dart';
import '../../../config/Common/Widgets/CommontextField.dart';
import '../../../config/router/router.gr.dart';

@RoutePage()
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobilenumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // form key

  bool _isloading = false; // loading state

  void _signup(BuildContext context) async {
    setState(() {
      _isloading = true; // showing loading indication
    });

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Update user's display name
      await userCredential.user
          ?.updateProfile(displayName: _nameController.text);
      await userCredential.user?.reload();

      // Store user data in Firestore
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'uid': userCredential.user?.uid,
        'name': _nameController.text,
        'email': _emailController.text,
        'mobile_number': _mobilenumberController.text,
        'created_at': FieldValue.serverTimestamp(),
      });
      // Signup successful, navigate to home page
      AutoRouter.of(context).push(Login());
    } on FirebaseAuthException catch (e) {
      // Handle signup errors
      String errorMessage;
      if (e.code == 'email-already-in-use') {
        errorMessage = 'The email address is already in use by another account.';
      } else {
        errorMessage = 'Signup error: ${e.message}';
      }

      // Show error message using SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
      print("Signup error: ${e.message}");
    }finally {
      setState(() {
        _isloading = false; // hide the loading indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100,),
                Container(
                  height: 100,
                  child: Image.asset('assets/images/signup.png'),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormFiled(
                  controller: _nameController,
                  labelText: "Enter your name",
                  prefixIcon: Icons.person,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter an name';
                    }
                    return null;
                  },
                  enabled: true,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  onChanged: (onChanged){},
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormFiled(
                  controller: _emailController,
                  labelText: "Email",
                  prefixIcon: Icons.email,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  enabled: true,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  onChanged: (onChanged){},
                ),

                SizedBox(
                  height: 20,
                ),

                CustomTextFormFiled(
                  controller: _passwordController,
                  labelText: "password",
                  prefixIcon: Icons.remove_red_eye,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                      return 'Password must contain at least one uppercase letter';
                    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
                      return 'Password must contain at least one lowercase letter';
                    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                      return 'Password must contain at least one number';
                    } else if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                      return 'Password must contain at least one special character';
                    }
                    return null;
                  },
                  enabled: true,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  onChanged: (onChanged){},
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormFiled(
                  controller: _mobilenumberController,
                  labelText: "Mobile Number",
                  prefixIcon: Icons.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a mobile number';
                    } else if (!RegExp(r'^\+?1?\d{9,15}$').hasMatch(value)) {
                      return 'Please enter a valid mobile number';
                    }
                    return null;
                  },
                  enabled: true,
                  keyboardType: TextInputType.phone,
                  obscureText: false,
                  onChanged: (onChanged) {},
                ),

                SizedBox(height: 16.0),
                _isloading
                    ? CircularProgressIndicator()
                    : CustomElevetedButton(
                  buttonText: "SignUp",
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  elevation: 4,
                  borderRadius: 15,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _signup(context);
                    }
                  },
                  buttonWidth: 180,
                  buttonHeight: 50,
                  buttontextSize: 17,
                ),

                SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    // Navigate back to LoginScreen
                    AutoRouter.of(context)
                        .pushAndPopUntil(Login(), predicate: (route) => false);
                    // Navigator.pop(context);
                  },
                  child: Text('Already have an account? Login'),
                ),
                // if (_isloading)
                //   Container(
                //     color: Colors.black.withOpacity(0.5),
                //     child: Center(
                //       child: CircularProgressIndicator(),
                //     ),
                //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



