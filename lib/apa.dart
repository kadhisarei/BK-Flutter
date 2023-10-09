// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:intl/intl.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Layanan(),
//   ));
// }

// class Layanan extends StatefulWidget {
//   const Layanan({Key? key}) : super(key: key);

//   @override
//   _LayananState createState() => _LayananState();
// }

// class _LayananState extends State<Layanan> {
//   late int _selectedTabIndex;
//   List<Map<String, dynamic>> layananList = [];
//   final String apiUrl = 'http://effective-ampland.gl.at.ply.gg:7440/api/index';

//   Future<void> fetchData() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     String? bearerToken = preferences.getString('token');

//     if (bearerToken != null) {
//       final response = await http.get(
//         Uri.parse(apiUrl),
//         headers: {
//           'Authorization': 'Bearer $bearerToken',
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           layananList = List<Map<String, dynamic>>.from(data['layanan']);
//         });
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } else {
//       throw Exception('Bearer token is missing');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _selectedTabIndex = 0;
//     fetchData();
//   }

//   void _onTabChanged(int index) {
//     setState(() {
//       _selectedTabIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final widthApp = MediaQuery.of(context).size.width;
//     final heightApp = MediaQuery.of(context).size.height;
//     final paddingTop = MediaQuery.of(context).padding.top;
//     final heightBody = heightApp - paddingTop;

//     List<Map<String, dynamic>> layananByStatus = [];
//     String statusFilter = '';

//     if (_selectedTabIndex == 0) {
//       statusFilter = 'Waiting';
//     } else if (_selectedTabIndex == 1) {
//       statusFilter = 'Approved';
//     } else if (_selectedTabIndex == 2) {
//       statusFilter = 'Reschedule';
//     } else if (_selectedTabIndex == 3) {
//       statusFilter = 'Finished';
//     } else if (_selectedTabIndex == 4) {
//       statusFilter = 'Canceled';
//     }

//     layananByStatus = layananList.where((layanan) => layanan['status'] == statusFilter).toList();

//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 49, 78, 207),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           "Pertemuan",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//             height: 50,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: [
//                 _buildTabButton(0, "Menunggu"),
//                 _buildTabButton(1, "Disetujui"),
//                 _buildTabButton(2, "Reschedule"),
//                 _buildTabButton(3, "Selesai"),
//                 _buildTabButton(4, "Dibatalkan"),
//               ],
//             ),
//           ),
//           SizedBox(height: heightBody * 0.03),
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Color(0xFF3D74DF),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//               ),
//               child: ListView.builder(
//                 itemCount: layananByStatus.length,
//                 itemBuilder: (context, index) {
//                   return buildLayananItem(layananByStatus[index]);
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => Jadwal()),
//           );
//         },
//         child: Icon(Icons.calendar_month_outlined),
//         backgroundColor: Color.fromARGB(255, 255, 195, 3),
//       ),
//     );
//   }

//   Widget _buildTabButton(int index, String text) {
//     final isActive = _selectedTabIndex == index;

//     return GestureDetector(
//       onTap: () => _onTabChanged(index),
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 8),
//         padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
//         decoration: BoxDecoration(
//           color: isActive ? Colors.white : Colors.transparent,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: TextStyle(
//               color: isActive ? Color.fromARGB(255, 49, 78, 207) : Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildLayananItem(Map<String, dynamic> layanan) {
//     final widthApp = MediaQuery.of(context).size.width;
//     final heightApp = MediaQuery.of(context).size.height;
//     final guru = layanan['guru'];
//     final layananName = layanan['layanan'];
//     final tanggal = layanan['tanggal'];
//     final jam = layanan['jam'];
//     final status = layanan['status'];

//     return Padding(
//       padding: EdgeInsets.only(top: 25),
//       child: Align(
//         alignment: Alignment.center,
//         child: Container(
//           width: widthApp * 0.8,
//           height: heightApp * 0.25,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Column(
//             children: [
//               SizedBox(height: heightApp * 0.03),
//               Row(
//                 children: [
//                   SizedBox(width: widthApp * 0.04),
//                   CircleAvatar(
//                     radius: 28,
//                     backgroundColor: Colors.black,
//                     child: Center(
//                       child: Icon(
//                         Icons.person,
//                         size: 30,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: widthApp * 0.04),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         guru,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontFamily: 'Quicksand',
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       SizedBox(height: heightApp * 0.01),
//                       Text(
//                         layananName,
//                         style: TextStyle(
//                           color: Color(0xFF2562D8),
//                           fontFamily: 'Quicksand',
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: heightApp * 0.02),
//               Divider(
//                 color: Color.fromRGBO(52, 52, 52, 0.5),
//                 thickness: 1,
//                 indent: 0,
//                 endIndent: 0,
//               ),
//               Row(
//                 children: [
//                   SizedBox(width: widthApp * 0.05),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             child: Icon(
//                               Icons.calendar_month_sharp,
//                               size: 25,
//                             ),
//                           ),
//                           SizedBox(width: widthApp * 0.02),
//                           Text(
//                             tanggal,
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontFamily: 'Quicksand',
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: heightApp * 0.01),
//                       Row(
//                         children: [
//                           Container(
//                             child: Icon(
//                               Icons.access_time_filled_outlined,
//                               size: 25,
//                             ),
//                           ),
//                           SizedBox(width: widthApp * 0.02),
//                           Text(
//                             jam,
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.black,
//                               fontFamily: 'Quicksand',
//                               fontWeight: FontWeight.w500,
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: widthApp * 0.1),
//                   GestureDetector(
//                     onTap: () {
//                       // Handle detail tap
//                     },
//                     child: Container(
//                       width: widthApp * 0.24,
//                       height: heightApp * 0.045,
//                       decoration: BoxDecoration(
//                         color: Colors.blue,
//                         borderRadius: BorderRadius.circular(45),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.info,
//                             color: Colors.white,
//                           ),
//                           SizedBox(width: 4),
//                           Text(
//                             "Detail",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: heightApp * 0.01),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Jadwal extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Jadwal"),
//       ),
//       body: Center(
//         child: Text("Halaman Jadwal"),
//       ),
//     );
//   }
// }

// String _formatDate(String inputDate) {
//   DateTime dateTime = DateTime.parse(inputDate);
//   return DateFormat('EEEE, d MMMM').format(dateTime); // Format the date
// }
