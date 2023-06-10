import 'package:bk_flutter/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        height: 350,
                        color: Color.fromARGB(255, 49, 78, 207),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 20,
                      child: Image.asset(
                        'assets/images/Logo.png',
                        scale: 2,
                      ),
                    ),
                    Positioned(
                      top: 110,
                      right: 20,
                      child: Image.asset(
                        'assets/images/Coffee.png',
                        height: 150,
                      ),
                    ),
                    Positioned(
                      top: 210,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SIGN IN',
                            style: TextStyle(color: Colors.white, fontSize: 36),
                          ),
                          Text(
                            'To Your Account',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(35, 370, 35, 0),
                        child: Column(
                          children: [
                            TextFormField(
                              style: TextStyle(fontSize: 10),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 3, color: Colors.black),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: 'Enter Your Email',
                                labelText: 'Email',
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              style: TextStyle(fontSize: 10),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 3, color: Colors.black),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: 'Enter Your Password',
                                labelText: 'Password',
                              ),
                            ),
                            SizedBox(height: 50),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return HistoryPage();
                                  }),
                                );
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
                                    horizontal: 40, vertical: 15),
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
