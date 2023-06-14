import 'package:bk_flutter/detail.dart';
import 'package:bk_flutter/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Models/Konsuling.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late SharedPreferences preferences;
  bool isloading = false;
  List<History> histories = [];
  @override
  void initState() {
    super.initState();
    getuserData();
  }

  void getuserData() async {
    setState(() {
      isloading = true;
    });
    preferences = await SharedPreferences.getInstance();
    histories = await getHistory();
    // Call getHistory function and assign the result to histories
    setState(() {
      isloading = false;
    });
  }

  void logout() {
    preferences.clear();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 78, 207),
      body: FutureBuilder(
        future: getHistory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LayoutBuilder(
              builder: (context, constraints) {
                double containerWidth = constraints.maxWidth * 0.9;
                double containerHeight = constraints.maxHeight * 0.25;
                return Padding(
                  padding: EdgeInsets.fromLTRB(0, 24.0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).padding.top),
                      SizedBox(height: 16.0),
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: isloading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Home',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        logout();
                                      },
                                      child: Text('logout')),
                                  SizedBox(height: 16.0),
                                  Text(
                                    'Welcome ${preferences.getString('name').toString()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      SizedBox(height: 30.0),
                      Expanded(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: containerWidth,
                            height: containerHeight,
                            padding: EdgeInsets.all(0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 8.0),
                                        Text(
                                          'Ongoing Meeting',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 49, 78, 207),
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        SizedBox(height: 8.0),
                                        Text(
                                          'Senin, 30 January 2023',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(52, 52, 52, 1),
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        SizedBox(height: 8.0),
                                        Text(
                                          'Date Here',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(52, 52, 52, 1),
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        SizedBox(height: 8.0),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 70.0,
                                  padding: EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 195, 3),
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Ricky Rich M.Pd',
                                        style: TextStyle(
                                          color: Color.fromRGBO(52, 52, 52, 1),
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Container(
                                        width: 35.0,
                                        height: 35.0,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromARGB(
                                                        255, 255, 255, 255)
                                                    .withOpacity(0.8),
                                              ),
                                            ),
                                            Container(
                                              width: 30.0,
                                              height: 30.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromARGB(
                                                    255, 255, 195, 3),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(35, 35, 35, 0),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(30)),
                            color: Color.fromARGB(255, 61, 116, 223),
                          ),
                          width: double.infinity,
                          child: ListView.builder(
  itemCount: histories.length,
  itemBuilder: (context, index) {
    History history = histories[index];
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman detail jika item diklik
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => DetailPage(history: history)),
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100.0,
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      history.nama_bk,
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(52, 52, 52, 1),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      history.nama_layanan,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 49, 78, 207),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 49, 78, 207),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    history.jam_mulai,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  },
),

                        //   child: SingleChildScrollView(
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         GestureDetector(
                        //           onTap: () {
                        //             Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) => DetailPage()),
                        //             );
                        //           },
                        //           child: Container(
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(10),
                        //             ),
                        //             width: double.infinity,
                        //             height: 100.0,
                        //             child: Row(
                        //               children: [
                        //                 Expanded(
                        //                   child: Container(
                        //                     padding: EdgeInsets.all(10),
                        //                     decoration: BoxDecoration(
                        //                       color: Color.fromARGB(
                        //                           255, 255, 255, 255),
                        //                       borderRadius: BorderRadius.only(
                        //                         topLeft: Radius.circular(10),
                        //                         bottomLeft: Radius.circular(10),
                        //                       ),
                        //                     ),
                        //                     child: Column(
                        //                       crossAxisAlignment:
                        //                           CrossAxisAlignment.start,
                        //                       mainAxisAlignment:
                        //                           MainAxisAlignment.center,
                        //                       children: [
                        //                         Text(
                        //                           'Cassandra Fitriani',
                        //                           style: TextStyle(
                        //                             fontSize: 10,
                        //                             color: Color.fromRGBO(
                        //                                 52, 52, 52, 1),
                        //                           ),
                        //                         ),
                        //                         SizedBox(height: 10),
                        //                         Text(
                        //                           'Bimbingan Pribadi',
                        //                           style: TextStyle(
                        //                             fontSize: 12,
                        //                             color: Color.fromARGB(
                        //                                 255, 49, 78, 207),
                        //                             fontWeight: FontWeight.bold,
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                 ),
                        //                 Expanded(
                        //                   child: Container(
                        //                     decoration: BoxDecoration(
                        //                       color: Color.fromARGB(
                        //                           255, 49, 78, 207),
                        //                       borderRadius: BorderRadius.only(
                        //                         topRight: Radius.circular(10),
                        //                         bottomRight:
                        //                             Radius.circular(10),
                        //                       ),
                        //                     ),
                        //                     child: Center(
                        //                       child: Text(
                        //                         '21/21/21',
                        //                         style: TextStyle(
                        //                           color: Colors.white,
                        //                           fontSize: 18,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //         SizedBox(
                        //           height: 20,
                        //         ),
                        //         Container(
                        //           decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(10)),
                        //           width: double.infinity,
                        //           height: 100.0,
                        //           child: Row(
                        //             children: [
                        //               Expanded(
                        //                 child: Container(
                        //                   padding: EdgeInsets.all(10),
                        //                   decoration: BoxDecoration(
                        //                       color: Color.fromARGB(
                        //                           255, 255, 255, 255),
                        //                       borderRadius: BorderRadius.only(
                        //                           topLeft: Radius.circular(10),
                        //                           bottomLeft:
                        //                               Radius.circular(10))),
                        //                   child: Column(
                        //                     crossAxisAlignment:
                        //                         CrossAxisAlignment.start,
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment.center,
                        //                     children: [
                        //                       Text(
                        //                         'Cassandra Fitriani',
                        //                         style: TextStyle(
                        //                             fontSize: 10,
                        //                             color: Color.fromRGBO(
                        //                                 52, 52, 52, 1)),
                        //                       ),
                        //                       SizedBox(
                        //                         height: 10,
                        //                       ),
                        //                       Text(
                        //                         'Bimbingan Pribadi',
                        //                         style: TextStyle(
                        //                             fontSize: 12,
                        //                             color: Color.fromARGB(
                        //                                 255, 49, 78, 207),
                        //                             fontWeight:
                        //                                 FontWeight.bold),
                        //                       )
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ),
                        //               Expanded(
                        //                 child: Container(
                        //                   decoration: BoxDecoration(
                        //                       color: Color.fromARGB(
                        //                           255, 49, 78, 207),
                        //                       borderRadius: BorderRadius.only(
                        //                           topRight: Radius.circular(10),
                        //                           bottomRight:
                        //                               Radius.circular(10))),
                        //                   child: Center(
                        //                     child: Text(
                        //                       '21/21/21',
                        //                       style: TextStyle(
                        //                           color: Colors.white,
                        //                           fontSize: 18),
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
