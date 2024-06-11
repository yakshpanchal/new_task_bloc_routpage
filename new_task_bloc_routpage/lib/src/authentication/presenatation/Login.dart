// ignore: file_names

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../config/Common/Widgets/CommonElevetedButton.dart';
import '../../../config/Common/Widgets/CommontextField.dart';
import '../../../config/router/router.gr.dart';

@RoutePage()
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // form key

  String _role = 'owner'; // default role
  bool _isloading = false; // loading state

  void _login(BuildContext context) async {
    setState(() {
      _isloading = true;
    });
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
          // Pass role to the next screen or handle it accordingly
      );
      // Store user role in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'role': _role,
        'email': _emailController.text,
      }, SetOptions(merge: true));  // Use merge: true to update existing data
      AutoRouter.of(context).push(const MainRoute());
    } on FirebaseAuthException catch (e) {
      // Handle login errors
      print("Login error: ${e.message}");
      // Show SnackBar for incorrect login credentials
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect email or password. Please try again.'),
          duration: Duration(seconds: 3),
        ),
      );
    }finally {
      setState(() {
        _isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login', style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                SizedBox(
                  height: 100,
                  child: Image.asset('assets/images/login_(1).png'),
                ),
                const SizedBox(
                  height: 10,
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
                const SizedBox(
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
                SizedBox(height: 20,),
                
                // Role Selection
                ToggleButtons(
                  borderColor: Colors.grey,
                  fillColor: Colors.grey.shade700,
                  borderWidth: 2,
                  selectedBorderColor: Colors.grey.shade700,
                  selectedColor: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Owner',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Customer',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      _role = index == 0 ? 'owner' : 'rentCustomer';
                    });
                  },
                  isSelected: [_role == 'owner', _role == 'rentCustomer'],
                ),
        
                const SizedBox(height: 16.0),
                _isloading
                    ? CircularProgressIndicator()
                : CustomElevetedButton(
                    buttonText: "Login",
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    elevation: 4,
                    borderRadius: 15,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _login(context);
                      }
                      },
                    buttonWidth: 180,
                    buttonHeight: 50,
                    buttontextSize: 17,
                ),
        
                const SizedBox(height: 10.0),
                TextButton(
                  onPressed: () {
                    AutoRouter.of(context)
                        .pushAndPopUntil(SignUp(), predicate: (route) => false);
                  },
                  child: const Text('Don\'t have an account? Sign up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
