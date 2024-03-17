// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late String _fname, _lname, _email, _phone;
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          //appbar
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
            elevation: 0.0,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              reverse: true,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Form(
                  key: formstate,
                  child: Column(
                    children: [
                      //headertext1
                      const SizedBox(height: 20),
                      const Text(
                        'Create A New Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //textfield First Name
                      const SizedBox(height: 10),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your first name";
                          }
                          return null;
                        },
                        onSaved: (fName) {
                          _fname = fName!;
                        },
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            fillColor: Color(0xFFFAFAFA),
                            filled: true,
                            hintText: "First name",
                            hintStyle: TextStyle(
                              color: Color(0xFF999999),
                            )),
                      ),

                      //textfield Last Name
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your last name";
                          }
                          return null;
                        },
                        onSaved: (lName) {
                          _lname = lName!;
                        },
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            fillColor: Color(0xFFFAFAFA),
                            filled: true,
                            hintText: "Last name",
                            hintStyle: TextStyle(
                              color: Color(0xFF999999),
                            )),
                      ),

                      //textfield Email
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your email";
                          } else if (!RegExp(
                                  "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                        onSaved: (email) {
                          _email = email!;
                        },
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            fillColor: Color(0xFFFAFAFA),
                            suffixIcon: Icon(Icons.email),
                            filled: true,
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Color(0xFF999999),
                            )),
                      ),
                      //textfield mobile number
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter a mobile number";
                          } else if (value.length > 11) {
                            return "Enter a valid mobile number";
                          } else if (value.length < 11) {
                            return "Enter a valid mobile number";
                          }
                          return null;
                        },
                        onSaved: (phone) {
                          _phone = phone!;
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            fillColor: Color(0xFFFAFAFA),
                            suffixIcon: Icon(Icons.phone),
                            filled: true,
                            hintText: "Mobile number",
                            hintStyle: TextStyle(
                              color: Color(0xFF999999),
                            )),
                      ),

                      //textfield Create password
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _password,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter a password";
                          } else if (value.length < 8) {
                            return "Should be at least 8 characters";
                          } else if (!RegExp(".*[0-9].*").hasMatch(value)) {
                            return 'Should have at least one number. ';
                          } else if (!RegExp('.*[a-z].*').hasMatch(value)) {
                            return 'Should have at least one lowercase letter.';
                          } else if (!RegExp('.*[A-Z].*').hasMatch(value)) {
                            return 'Should have at least one uppercase letter.';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            fillColor: Color(0xFFFAFAFA),
                            suffixIcon: Icon(Icons.lock),
                            filled: true,
                            hintText: "Create password",
                            hintStyle: TextStyle(
                              color: Color(0xFF999999),
                            )),
                        obscureText: true,
                      ),
                      //textfield Confirm password
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _confirmpassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter a password";
                          }else if(_password.text != _confirmpassword.text){
                            return "Password doesn't match";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            fillColor: Color(0xFFFAFAFA),
                            suffixIcon: Icon(Icons.lock),
                            filled: true,
                            hintText: "Confirm password",
                            hintStyle: TextStyle(
                              color: Color(0xFF999999),
                            )),
                        obscureText: true,
                      ),

                      //sign up button
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 48,
                        width: 275,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor: const Color(0xFF00ADCF)),
                          onPressed: () {
                            // Add your sign up logic here
                            if (formstate.currentState!.validate()) {}
                          },
                          child: const Text(
                            'Create Account',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                      //text "or"
                      const SizedBox(height: 15),
                      const Text("Or Continue With:",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(height: 10),

                      //google icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(),
                            child: SvgPicture.asset('assets/icons/google.svg',
                                height: 35),
                          ),

                          //facebook icon
                          const SizedBox(width: 20),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(),
                            child: SvgPicture.asset('assets/icons/facebook.svg',
                                height: 40),
                          ),
                        ],
                      ),
                      //text Already have an account?
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/login");
                            },
                            child: const Text('Sign In',
                                style: TextStyle(
                                    color: Color(0xFF00ADCF),
                                    fontSize: 13,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline)),
                          ),
                        ],
                      ),
                      //end
                    ],
                  ),
                ),
              ),
            ),
          )));
}
