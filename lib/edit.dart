// import 'package:bk_flutter/layanan.dart';
// import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:intl/intl.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'home.dart';

// class Edit extends StatefulWidget {
//   const Edit({Key? key}) : super(key: key);

//   @override
//   State<Edit> createState() => _EditState();
// }

// class _EditState extends State<Edit> {
//   final _formKey = GlobalKey<FormState>();

//   TextEditingController _tempat = TextEditingController();
//   TextEditingController _pesan = TextEditingController();
//   List<dynamic> jenisLayananList = [];
//   List<dynamic> siswaList = [];
//   List<String> jenisKarirList = ['Kuliah', 'Kompetisi', 'Bekerja'];
//   List<int> selectedSiswaIds = [];
//   DateTime? selectedDate;
//   DateTime? selectedTime;
//   int? selectedJenisLayananId;
//   String? selectedJenisKarir;
//   DateTime _dateTime = DateTime.now();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 255, 255, 255),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(minHeight: constraints.maxHeight),
//               child: IntrinsicHeight(
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       child: Container(
//                         height: constraints.maxHeight * 0.4,
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 49, 78, 207),
//                           borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(20),
//                             bottomRight: Radius.circular(20),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.25),
//                               offset: Offset(0, 4),
//                               blurRadius: 4,
//                               spreadRadius: 0,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: constraints.maxHeight * 0.06,
//                       left: constraints.maxWidth * 0.33,
//                       child: Image.asset(
//                         'assets/images/Logo.png',
//                         scale: constraints.maxWidth * 0.004,
//                       ),
//                     ),
//                     Positioned(
//                       top: constraints.maxHeight * 0.14,
//                       left: constraints.maxWidth * 0.25,
//                       child: Column(
//                         children: [
//                           Image.asset(
//                             'assets/images/meeting.png',
//                             height: constraints.maxHeight * 0.20,
//                           ),
//                           Text(
//                             'Arrange Meeting',
//                             style: TextStyle(
//                               fontFamily: 'Quicksand',
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                               fontSize: constraints.maxWidth * 0.065,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Form(
//                       key: _formKey,
//                       child: SingleChildScrollView(
//                         padding: EdgeInsets.fromLTRB(
//                           constraints.maxWidth * 0.1,
//                           constraints.maxHeight * 0.5,
//                           constraints.maxWidth * 0.1,
//                           0,
//                         ),
//                         child: Column(
//                           children: [
//                             DropdownButtonFormField<int>(
//                               value: selectedJenisLayananId,
//                               items:
//                                   jenisLayananList.map<DropdownMenuItem<int>>(
//                                 (dynamic item) {
//                                   return DropdownMenuItem<int>(
//                                     value: item['id'],
//                                     child: Text(item['jenis_layanan']),
//                                   );
//                                 },
//                               ).toList(),
//                               onChanged: (int? newValue) {
//                                 setState(() {
//                                   selectedJenisLayananId = newValue!;
//                                   selectedSiswaIds.clear();
//                                   selectedJenisKarir = null;
//                                 });
//                               },
//                               decoration: InputDecoration(
//                                 labelText: 'Pilih Jenis Layanan',
//                                 border: OutlineInputBorder(),
//                               ),
//                             ),
//                             if (selectedJenisLayananId == 3)
//                               SizedBox(height: constraints.maxHeight * 0.05),
//                             if (selectedJenisLayananId == 3)
//                               DropdownButtonFormField<String>(
//                                 value: selectedJenisKarir,
//                                 items: jenisKarirList
//                                     .map<DropdownMenuItem<String>>(
//                                   (String item) {
//                                     return DropdownMenuItem<String>(
//                                       value: item,
//                                       child: Text(item),
//                                     );
//                                   },
//                                 ).toList(),
//                                 onChanged: (String? newValue) {
//                                   setState(() {
//                                     selectedJenisKarir = newValue;
//                                   });
//                                 },
//                                 decoration: InputDecoration(
//                                   labelText: 'Pilih Jenis Karir',
//                                   border: OutlineInputBorder(),
//                                 ),
//                               ),
//                             if (selectedJenisLayananId == 4)
//                               SizedBox(height: constraints.maxHeight * 0.05),
//                             SizedBox(height: constraints.maxHeight * 0.05),
//                             Container(
//                               width: double.infinity,
//                               height: 150,
//                               decoration: BoxDecoration(
//                                 color: Color.fromARGB(255, 49, 78, 207),
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                               padding: EdgeInsets.all(16),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     'Tanggal dan waktu',
//                                     style: TextStyle(
//                                       fontFamily: 'Quicksand',
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(height: 15),
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         child: TextFormField(
//                                           readOnly: true,
//                                           onTap: () {
//                                             DatePicker.showDatePicker(
//                                               context,
//                                               showTitleActions: true,
//                                               minTime: DateTime(2000, 1, 1),
//                                               maxTime: DateTime(2100, 12, 31),
//                                               onChanged: (date) {
//                                                 print('change $date');
//                                               },
//                                               onConfirm: (date) {
//                                                 setState(() {
//                                                   selectedDate = date;
//                                                 });
//                                                 print('confirm $date');
//                                               },
//                                               currentTime: selectedDate,
//                                               locale: LocaleType.en,
//                                             );
//                                           },
//                                           controller: TextEditingController(
//                                             text: selectedDate != null
//                                                 ? DateFormat('yyyy-MM-dd')
//                                                     .format(selectedDate!)
//                                                 : '',
//                                           ),
//                                           decoration: InputDecoration(
//                                             hintText: 'dd/mm/yy',
//                                             fillColor: Colors.white,
//                                             filled: true,
//                                             border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(15),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(width: 5),
//                                       Expanded(
//                                         child: DateTimeField(
//                                           format: DateFormat('HH:mm'),
//                                           decoration: InputDecoration(
//                                             hintText: '--:--',
//                                             fillColor: Colors.white,
//                                             filled: true,
//                                             border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(15),
//                                             ),
//                                             alignLabelWithHint: true,
//                                           ),
//                                           onChanged: (time) {
//                                             setState(() {
//                                               selectedTime = time;
//                                             });
//                                           },
//                                           onShowPicker:
//                                               (context, currentValue) async {
//                                             final time = await showTimePicker(
//                                               context: context,
//                                               initialTime:
//                                                   TimeOfDay.fromDateTime(
//                                                 currentValue ?? DateTime.now(),
//                                               ),
//                                             );
//                                             return DateTimeField.convert(time);
//                                           },
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: constraints.maxHeight * 0.05),
//                             Container(
//                               width: double.infinity,
//                               height: 150,
//                               decoration: BoxDecoration(
//                                 color: Color.fromARGB(255, 49, 78, 207),
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                               padding: EdgeInsets.all(16),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     'Tempat Konseling',
//                                     style: TextStyle(
//                                       fontFamily: 'Quicksand',
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(height: 15),
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         child: TextFormField(
//                                           controller: _tempat,
//                                           decoration: InputDecoration(
//                                             border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(15),
//                                             ),
//                                             fillColor: Colors.white,
//                                             hintText: 'Masukan Lokasi',
//                                             filled: true,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: constraints.maxHeight * 0.05),
//                             Container(
//                               width: double.infinity,
//                               height: 150,
//                               decoration: BoxDecoration(
//                                 color: Color.fromARGB(255, 49, 78, 207),
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                               padding: EdgeInsets.all(16),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     'Topik Pembicaraan',
//                                     style: TextStyle(
//                                       fontFamily: 'Quicksand',
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(height: 15),
//                                   Row(
//                                     children: [
//                                       Expanded(
//                                         child: TextFormField(
//                                           controller: _pesan,
//                                           decoration: InputDecoration(
//                                             border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(15),
//                                             ),
//                                             fillColor: Colors.white,
//                                             hintText: 'Masukan Topik',
//                                             filled: true,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: constraints.maxHeight * 0.07),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     primary: Color.fromARGB(255, 255, 195, 3),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15),
//                                     ),
//                                   ),
//                                   child: Padding(
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: constraints.maxWidth * 0.09,
//                                       vertical: constraints.maxHeight * 0.02,
//                                     ),
//                                     child: Text('Cancel'),
//                                   ),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () async {
//                                     if (selectedJenisLayananId == null) {
//                                       showDialog(
//                                         context: context,
//                                         builder: (context) {
//                                           return AlertDialog(
//                                             title: Text('Validation Error'),
//                                             content:
//                                                 Text('Pilih Jenis Layanan.'),
//                                             actions: [
//                                               TextButton(
//                                                 onPressed: () {
//                                                   Navigator.pop(context);
//                                                 },
//                                                 child: Text('OK'),
//                                               ),
//                                             ],
//                                           );
//                                         },
//                                       );
//                                       return;
//                                     }

//                                     if (selectedJenisLayananId == 4 &&
//                                         selectedSiswaIds.isEmpty) {
//                                       showDialog(
//                                         context: context,
//                                         builder: (context) {
//                                           return AlertDialog(
//                                             title: Text('Validation Error'),
//                                             content: Text(
//                                                 'Pilih setidaknya satu siswa.'),
//                                             actions: [
//                                               TextButton(
//                                                 onPressed: () {
//                                                   Navigator.pop(context);
//                                                 },
//                                                 child: Text('OK'),
//                                               ),
//                                             ],
//                                           );
//                                         },
//                                       );
//                                       return;
//                                     }

//                                     if (selectedJenisLayananId == 3 &&
//                                         selectedJenisKarir == null) {
//                                       showDialog(
//                                         context: context,
//                                         builder: (context) {
//                                           return AlertDialog(
//                                             title: Text('Validation Error'),
//                                             content: Text('Pilih satu.'),
//                                             actions: [
//                                               TextButton(
//                                                 onPressed: () {
//                                                   Navigator.pop(context);
//                                                 },
//                                                 child: Text('OK'),
//                                               ),
//                                             ],
//                                           );
//                                         },
//                                       );
//                                       return;
//                                     }

//                                     if (selectedDate == null ||
//                                         selectedTime == null) {
//                                       showDialog(
//                                         context: context,
//                                         builder: (context) {
//                                           return AlertDialog(
//                                             title: Text('Validation Error'),
//                                             content: Text(
//                                                 'Pilih tanggal dan waktu konseling.'),
//                                             actions: [
//                                               TextButton(
//                                                 onPressed: () {
//                                                   Navigator.pop(context);
//                                                 },
//                                                 child: Text('OK'),
//                                               ),
//                                             ],
//                                           );
//                                         },
//                                       );
//                                       return;
//                                     }

//                                     if (_tempat.text.isEmpty) {
//                                       showDialog(
//                                         context: context,
//                                         builder: (context) {
//                                           return AlertDialog(
//                                             title: Text('Validation Error'),
//                                             content: Text(
//                                                 'Tempat konseling tidak boleh kosong.'),
//                                             actions: [
//                                               TextButton(
//                                                 onPressed: () {
//                                                   Navigator.pop(context);
//                                                 },
//                                                 child: Text('OK'),
//                                               ),
//                                             ],
//                                           );
//                                         },
//                                       );
//                                       return;
//                                     }

//                                     if (_pesan.text.isEmpty) {
//                                       showDialog(
//                                         context: context,
//                                         builder: (context) {
//                                           return AlertDialog(
//                                             title: Text('Validation Error'),
//                                             content: Text(
//                                                 'Topik pembicaraan tidak boleh kosong.'),
//                                             actions: [
//                                               TextButton(
//                                                 onPressed: () {
//                                                   Navigator.pop(context);
//                                                 },
//                                                 child: Text('OK'),
//                                               ),
//                                             ],
//                                           );
//                                         },
//                                       );
//                                       return;
//                                     }

//                                     final headers = {
//                                       'Content-Type': 'application/json',
//                                       'Accept': 'application/json',
//                                     };

//                                     final Map<String, dynamic> requestData = {
//                                       'id_layanan': selectedJenisLayananId,
//                                       'tempat': _tempat.text,
//                                       'pesan': _pesan.text,
//                                       'jenis_karir': selectedJenisKarir,
//                                       'jam_mulai': DateFormat('HH:mm')
//                                           .format(selectedTime!),
//                                       'tanggal_konseling':
//                                           DateFormat('yyyy-MM-dd')
//                                               .format(selectedDate!),
//                                     };

//                                     if (selectedSiswaIds.isNotEmpty) {
//                                       requestData['teman'] =
//                                           json.encode(selectedSiswaIds);
//                                     }

//                                     final response = await http.post(
//                                       Uri.parse(
//                                           'http://effective-ampland.gl.at.ply.gg:7440/api/store'),
//                                       headers: headers,
//                                       body: json.encode(requestData),
//                                     );

//                                     if (response.statusCode == 201) {
//                                       showDialog(
//                                         context: context,
//                                         builder: (context) {
//                                           return AlertDialog(
//                                             title: Text('Success'),
//                                             content: Text(
//                                                 'Data successfully sent to the server.'),
//                                             actions: [
//                                               TextButton(
//                                                 onPressed: () {
//                                                   Navigator.pop(context);
//                                                   // Navigasi ke halaman HistoryPage
//                                                   Navigator.of(context).push(
//                                                     MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           Layanan(),
//                                                     ),
//                                                   );
//                                                 },
//                                                 child: Text('OK'),
//                                               ),
//                                             ],
//                                           );
//                                         },
//                                       );
//                                     } else {
//                                       print(
//                                           'Failed to send data. Status code: ${response.statusCode}');
//                                     }
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     primary: Color.fromARGB(255, 255, 195, 3),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15),
//                                     ),
//                                   ),
//                                   child: Padding(
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: constraints.maxWidth * 0.09,
//                                       vertical: constraints.maxHeight * 0.02,
//                                     ),
//                                     child: Text('SAVE'),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: constraints.maxHeight * 0.07),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
