import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tt/controller/authcontroller.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formstate = GlobalKey();
  AuthController authController = AuthController();
  var data;
  Login() async {
    var formData = formstate.currentState;
    if (formData!.validate()) {
      var mobile;
      var pass;
      var data = await authController.LoginAuth(mobile.text, pass.text);
      if (data["result"] == "not here") {
        print("not here");
      }
    } else {
      //Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      print("user is here");
    }
  }

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
              'Sign In',
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
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Form(
                key: formstate,
                child: Column(
                  children: [
                    //headertext1
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    //headertext2
                    const SizedBox(height: 10),
                    const Text(
                      'Sign Into Your Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //textfield mobile number
                    const SizedBox(height: 50),
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

                    // textfield password
                    const SizedBox(height: 40),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter a Password";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          fillColor: Color(0xFFFAFAFA),
                          suffixIcon: Icon(Icons.lock),
                          filled: true,
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Color(0xFF999999),
                          )),
                      obscureText: true,
                    ),
                    //forget password
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forget your password?',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Montserrat-Medium',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //sign in button
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
                          // Add your sign in logic here
                          if (formstate.currentState!.validate()) {}
                        },
                        child: const Text(
                          'Sign In',
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
                    const SizedBox(height: 20),
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
                    //text dont have account
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don’t have an account?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/signup");
                          },
                          child: const Text('Sign up',
                              style: TextStyle(
                                  color: Color(0xFF00ADCF),
                                  fontSize: 13,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )));
}
