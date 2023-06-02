import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_animations/index.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  bool _isObscure = true;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
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

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50,horizontal: 16),
            child: Column(
              children: [

                Container(height: 150,).fadeIn(),

                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Align(alignment: Alignment.centerLeft,child: Text("Login to Your Account",style: GoogleFonts.poppins(fontSize: 18),)),
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
                            hintStyle: GoogleFonts.poppins(fontSize: 18,color: Colors.indigo),
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
                            }else if(!GetUtils.isEmail(value)){
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
                            hintStyle: GoogleFonts.poppins(fontSize: 18,color: Colors.indigo),
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
                                _isObscure ? Icons.visibility : Icons.visibility_off,
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo,elevation: 5.0),
                          onPressed: _submitForm,

                          child: SizedBox(width: Get.size.width*0.4,child: Center(child: Text('Login',style: GoogleFonts.poppins(fontSize: 18,color: Colors.white)))),
                        ),
                      ],
                    ),
                  ),
                ).fadeIn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
