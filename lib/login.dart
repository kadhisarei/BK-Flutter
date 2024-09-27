import 'dart:convert';

import 'package:bk_flutter/home.dart';
import 'package:bk_flutter/home2.dart';
import 'package:bk_flutter/master.dart';
import 'package:bk_flutter/method/api.dart';
import 'package:flutter/material.dart';
import 'package:bk_flutter/helper/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void loginUser() async {
    final data = {
      'email': email.text.toString(),
      'password': password.text.toString(),
    };
    final result = await API().postRequest(route: '/auth/login', data: data);
    final response = jsonDecode(result.body);
    if (response['status'] == 200) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setInt('user_id', response['user']['id']);
      await preferences.setString('name', response['user']['name']);
      await preferences.setString('email', response['user']['email']);
      await preferences.setString('token', response['token']);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response['message']),
        ),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Homes(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        height: constraints.maxHeight * 0.4,
                        color: Color.fromARGB(255, 49, 78, 207),
                      ),
                    ),
                    Positioned(
                      top: constraints.maxHeight * 0.07,
                      left: constraints.maxWidth * 0.05,
                      child: Image.asset(
                        'assets/images/Logo.png',
                        scale: constraints.maxWidth * 0.004,
                      ),
                    ),
                    Positioned(
                      top: constraints.maxHeight * 0.1,
                      right: constraints.maxWidth * 0.05,
                      child: Image.asset(
                        'assets/images/Coffee.png',
                        height: constraints.maxHeight * 0.25,
                      ),
                    ),
                    Positioned(
                      top: constraints.maxHeight * 0.2,
                      left: constraints.maxWidth * 0.05,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SIGN IN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: constraints.maxWidth * 0.065,
                            ),
                          ),
                          Text(
                            'To Your Account',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: constraints.maxWidth * 0.04,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                          constraints.maxWidth * 0.1,
                          constraints.maxHeight * 0.43,
                          constraints.maxWidth * 0.1,
                          0,
                        ),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: email,
                              style: TextStyle(fontSize: 10),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: constraints.maxWidth * 0.007,
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: 'Enter Your Email',
                                labelText: 'Email',
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.03),
                            TextFormField(
                              obscureText: true,
                              controller: password,
                              style: TextStyle(fontSize: 10),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: constraints.maxWidth * 0.007,
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: 'Enter Your Password',
                                labelText: 'Password',
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.07),
                            ElevatedButton(
                              onPressed: () {
                                loginUser();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 195, 3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: constraints.maxWidth * 0.17,
                                  vertical: constraints.maxHeight * 0.025,
                                ),
                                child: Text('LOGIN'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
