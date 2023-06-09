import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Positioned(
            top: 80,
            left: 20,
            child: Text('Details',style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(30),
              
              width: 250,
              height: 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Meeting Summary',style: TextStyle(fontSize: 20),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Pilihan Konseling',style: TextStyle(fontSize: 15),)
                    ],
                  ),
                  SizedBox(height: 5,),
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text('jepi'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Divider(
                color: Colors.black,
                thickness: 2,
                indent: 5,
                endIndent: 5,
              ),
              SizedBox(height: 10,),
              Row(
                    children: [
                      Text('Pilihan Konseling',style: TextStyle(fontSize: 15),)
                    ],
                  ),
                  SizedBox(height: 5,),
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text('jepi'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Divider(
                color: Colors.black,
                thickness: 2,
                indent: 5,
                endIndent: 5,
              ),
              SizedBox(height: 10,),
              Row(
                    children: [
                      Text('Pilihan Konseling',style: TextStyle(fontSize: 15),)
                    ],
                  ),
                  SizedBox(height: 5,),
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text('jepi'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Divider(
                color: Colors.black,
                thickness: 2,
                indent: 5,
                endIndent: 5,
              ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 30,
            child: Container(
              width: 300,
              height: 50,
              padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
              child: Center(
                child: ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(40),
                              backgroundColor: Color.fromARGB(255, 255, 195, 3),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          child: Text('LOGIN')),
              ),
            ),
          )
        ],
      ),
    );
  }
}