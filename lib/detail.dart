import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 78, 207),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 76.8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      padding: EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Meeting Summary',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          SizedBox(height: 20.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Pilihan Konseling',
                                  style: TextStyle(fontSize: 15.0)),
                              SizedBox(height: 10.0),
                              SingleChildScrollView(
                                child: Wrap(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                          'This is a longer sentence that should wrap instead of overflowing.'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Divider(
                            color: Colors.black,
                            thickness: 2.0,
                            indent: 5.0,
                            endIndent: 5.0,
                          ),
                          SizedBox(height: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Pilihan Konseling',
                                  style: TextStyle(fontSize: 15.0)),
                              SizedBox(height: 10.0),
                              SingleChildScrollView(
                                child: Wrap(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                          'Another longer sentence that should wrap instead of overflowing.'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Divider(
                            color: Colors.black,
                            thickness: 2.0,
                            indent: 5.0,
                            endIndent: 5.0,
                          ),
                          SizedBox(height: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Pilihan Konseling',
                                  style: TextStyle(fontSize: 15.0)),
                              SizedBox(height: 10.0),
                              SingleChildScrollView(
                                child: Wrap(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                          'A third longer sentence that should wrap instead of overflowing.'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Divider(
                            color: Colors.black,
                            thickness: 2.0,
                            indent: 5.0,
                            endIndent: 5.0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 35.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(40.0),
                          backgroundColor: Color.fromARGB(255, 255, 195, 3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text('SUBMIT'),
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
