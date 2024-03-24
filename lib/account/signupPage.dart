import 'package:carwash/Services/ApiProvider.dart';
import 'package:carwash/models/UserRegisterRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedGender;

  final List<String> genders = ['Male', 'Female', 'Other'];
  String _name = '';
  String _phone = '';
  String _email = '';
  String _otp = '';
  String _password = '';
  String _cnfpassword = '';
  String _referralCode = '';
  bool _isObscure = true;
  bool loading = false;
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      debugPrint("DWSD");
      UserRegisterRequest userRegisterRequest = UserRegisterRequest(
        dateofbirth: null,
        name: _name,
        email: _email,
        mobilenumber: _phone,
        password: _password,
      );
      debugPrint(userRegisterRequest.toJson().toString());
      ApiProvider(context).createlogin(userRegisterRequest).then((value) {
        setState(() {
          loading = false;
        });

        if (value.status == true) {
          setState(() {
            otpenable = true;
          });
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.message.toString())));
          context.pop();
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.message.toString())));
        }
        debugPrint(value.toJson().toString());
      }).catchError((eeror) {
        setState(() {
          loading = false;
        });
      });
      // Perform registration logic
      // You can access the form values using the _name, _phone, _email, _otp, and _referralCode variables
      // Submit the data to your backend or perform any required operations
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  bool otpenable = false;

  InputDecoration inputd(String lable, String hintext) {
    return InputDecoration(
      hintText: hintext,
      hintStyle: GoogleFonts.poppins(fontSize: 18, color: Colors.indigo),
      border: OutlineInputBorder(),
      filled: true,
      fillColor: Colors.white38,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[400]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.indigo),
      ),
      labelText: lable,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.indigo, size: 25),
        title: Text('Signup'),
      ),
      body: otpenable
          ? Container()
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Login to Your Account",
                          style: GoogleFonts.poppins(fontSize: 18),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: inputd("Name", "Emter Full Name"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _name = value;
                              });
                            },
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            decoration: inputd("Phone", "Emter Phone Number"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _phone = value;
                              });
                            },
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            decoration: inputd('Email', "Emter Email Id"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
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
                            decoration: inputd('Referral Code', ""),
                            onChanged: (value) {
                              setState(() {
                                _referralCode = value;
                              });
                            },
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              hintText: 'Enter your Password',
                              //   prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                              filled: true,
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 18, color: Colors.indigo),
                              fillColor: Colors.white38,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[400]!),
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
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              hintText: 'Enter your Password',
                              //   prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                              filled: true,
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 18, color: Colors.indigo),
                              fillColor: Colors.white38,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[400]!),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo),
                              ),
                              labelText: 'Conform Password',
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
                                return 'Please enter Conform password';
                              }
                              // Add password validation if needed
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _cnfpassword = value;
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
                                          child: Text('Register',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  color: Colors.white)))),
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ).fadeIn(),
    );
  }
}
