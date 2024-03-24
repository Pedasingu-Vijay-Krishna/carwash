import 'package:carwash/SharePref/SharePref.dart';
import 'package:carwash/account/signupPage.dart';
import 'package:carwash/homepage/user/useehomePage.dart';
import 'package:carwash/models/LoginRequest.dart';
import 'package:carwash/Services/ApiProvider.dart';
import 'package:carwash/router/RoteName.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'becameapattner.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  bool _isObscure = true;
  bool loading = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      loading = true;
      setState(() {});

      ApiProvider(context)
          .userlogin(LoginRequest(email: _email, password: _password))
          .then((value) {
        if (value.status!) {
          SharePref().setUser(value.result!);
          GoRouter.of(context).pushReplacementNamed(RouteNames.homepage);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.message.toString())));
        }
        setState(() {
          loading = false;
        });
      }).catchError((error) {
        debugPrint(error.toString());
        setState(() {
          loading = false;
        });
      });

      //  Get.offAll(() => const UserHome());
      // Perform login logic
      // You can access the form values using the _email and _password variables
      // Submit the data to your backend or perform any required operations
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 16),
            child: Column(
              children: [
                Lottie.asset('assets/wash.json'),

                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Login to Your Account",
                        style: GoogleFonts.poppins(fontSize: 18),
                      )),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            hintText: 'Enter your Email',
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 18, color: Colors.indigo),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white38,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                            labelText: 'Email Id',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Email';
                            } else if (!GetUtils.isEmail(value)) {
                              return 'Please Enter Correct Email';
                            }
                            // Add email validation if needed
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _email = value;
                            });
                          },
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            hintText: 'Enter your Password',
                            //   prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                            filled: true,
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 18, color: Colors.indigo),
                            fillColor: Colors.white38,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                            labelText: 'Password',
                            suffixIcon: GestureDetector(
                              onTap: _togglePasswordVisibility,
                              child: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                          obscureText: _isObscure,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            // Add password validation if needed
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                            });
                          },
                        ),
                        SizedBox(height: 16.0),
                        loading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.indigo,
                                    elevation: 5.0),
                                onPressed: _submitForm,
                                child: SizedBox(
                                    width: Get.size.width * 0.4,
                                    child: Center(
                                        child: Text('Login',
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                color: Colors.white)))),
                              ),
                      ],
                    ),
                  ),
                ).fadeIn(),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(RouteNames.signupPage);
                    //   Get.to(() => SignupPage(), duration: const Duration(seconds: 2));
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Don't Have an Account, ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.indigo,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                // "Become a Partner" Button
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed(RouteNames.becamepatner);

                    // Get.to(() => BecameaPattner(),
                    //     duration: Duration(seconds: 2),
                    //     curve: Curves.fastEaseInToSlowEaseOut);
                    // Handle "Become a Partner" button press
                  },
                  child: Text('Become a Partner ? '),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    if (SharePref().getUser() != null) {
      Future.delayed(Duration(milliseconds: 10), () {
        GoRouter.of(context).replaceNamed(RouteNames.homepage);
      });

      // TODO: implement initState
      super.initState();
    }
  }
}
