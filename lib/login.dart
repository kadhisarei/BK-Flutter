import 'package:bk_flutter/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

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
