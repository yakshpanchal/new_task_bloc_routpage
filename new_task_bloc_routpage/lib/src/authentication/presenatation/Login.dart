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
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isloading = false;
  bool _isOTPSent = false;
  String _verificationId = '';

  void _login(BuildContext context) async {
    setState(() {
      _isloading = true;
    });
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Navigate to main route
      AutoRouter.of(context).push(const MainRoute());
    } on FirebaseAuthException catch (e) {
      // Handle login errors
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect email or password. Please try again.'),
          duration: Duration(seconds: 3),
        ),
      );
    } finally {
      setState(() {
        _isloading = false;
      });
    }
  }

  void _sendOTP(BuildContext context) async {
    setState(() {
      _isloading = true;
    });
    await _auth.verifyPhoneNumber(
      phoneNumber: _phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-resolve on Android devices
        await _auth.signInWithCredential(credential);
        AutoRouter.of(context).push(const MainRoute());
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to verify phone number: ${e.message}')),
        );
        setState(() {
          _isloading = false;
        });
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
          _isOTPSent = true;
          _isloading = false;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }

  void _verifyOTP(BuildContext context) async {
    setState(() {
      _isloading = true;
    });
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _otpController.text,
      );
      await _auth.signInWithCredential(credential);
      AutoRouter.of(context).push(const MainRoute());
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to verify OTP: ${e.message}')),
      );
    } finally {
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
          'Login',
          style: TextStyle(
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
                SizedBox(height: 100),
                SizedBox(
                  height: 100,
                  child: Image.asset('assets/images/login_(1).png'),
                ),
                const SizedBox(height: 10),
                CustomTextFormFiled(
                  controller: _emailController,
                  labelText: "Email",
                  prefixIcon: Icons.email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  enabled: !_isOTPSent,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  onChanged: (onChanged) {},
                ),
                const SizedBox(height: 20),
                CustomTextFormFiled(
                  controller: _passwordController,
                  labelText: "Password",
                  prefixIcon: Icons.remove_red_eye,
                  validator: (value) {
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
                  enabled: !_isOTPSent,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  onChanged: (onChanged) {},
                ),
                const SizedBox(height: 20),
                CustomTextFormFiled(
                  controller: _phoneController,
                  labelText: "Phone Number",
                  prefixIcon: Icons.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    } else if (!RegExp(r'^\+?1?\d{9,15}$').hasMatch(value)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                  enabled: !_isOTPSent,
                  keyboardType: TextInputType.phone,
                  obscureText: false,
                  onChanged: (onChanged) {},
                ),
                if (_isOTPSent) ...[
                  const SizedBox(height: 20),
                  CustomTextFormFiled(
                    controller: _otpController,
                    labelText: "OTP",
                    prefixIcon: Icons.lock,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the OTP';
                      }
                      return null;
                    },
                    enabled: true,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    onChanged: (onChanged) {},
                  ),
                ],
                const SizedBox(height: 16.0),
                _isloading
                    ? CircularProgressIndicator()
                    : CustomElevetedButton(
                  buttonText: _isOTPSent ? "Verify OTP" : "Send OTP",
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  elevation: 4,
                  borderRadius: 15,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_isOTPSent) {
                        _verifyOTP(context);
                      } else {
                        _sendOTP(context);
                      }
                    }
                  },
                  buttonWidth: 180,
                  buttonHeight: 50,
                  buttontextSize: 17,
                ),
                const SizedBox(height: 10.0),
                TextButton(
                  onPressed: () {
                    AutoRouter.of(context).pushAndPopUntil(
                      const SignUp(),
                      predicate: (route) => false,
                    );
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
