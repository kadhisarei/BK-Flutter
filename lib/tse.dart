// import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:intl/intl.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Test extends StatefulWidget {
//   const Test({Key? key}) : super(key: key);

//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   final _formKey = GlobalKey<FormState>();
//   final String url = 'http://effective-ampland.gl.at.ply.gg:7440/api/create';
//   TextEditingController _tempat = TextEditingController();
//   TextEditingController _pesan = TextEditingController();

//   List<dynamic> jenisLayananList = [];
//   List<dynamic> siswaList = [];
//   List<int> selectedSiswaIds = [];
//   DateTime? selectedDate;
//   DateTime? selectedTime;

//   List<Map<String, dynamic>> jenisKarirList = [
//     {'id': 1, 'nama_jenis_karir': 'Jenis Karir A'},
//     {'id': 2, 'nama_jenis_karir': 'Jenis Karir B'},
//     {'id': 3, 'nama_jenis_karir': 'Jenis Karir C'},
//   ];
//   String? selectedJenisKarir;

//   int? selectedJenisLayananId;

//   Future<String?> getBearerToken() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     String? bearerToken = preferences.getString('token');
//     return bearerToken;
//   }

//   Future<void> getData() async {
//     try {
//       final String? bearerToken = await getBearerToken();

//       if (bearerToken == null) {
//         print('Bearer token is missing or null');
//         // Handle the case where token is missing
//         return;
//       }

//       final headers = {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $bearerToken',
//       };

//       var response = await http.get(Uri.parse(url), headers: headers);

//       if (response.statusCode == 200) {
//         Map<String, dynamic> responseData = json.decode(response.body);

//         if (responseData.containsKey('layananBK') &&
//             responseData.containsKey('siswa')) {
//           setState(() {
//             jenisLayananList = responseData['layananBK'];
//             siswaList = responseData['siswa'];
//           });
//         } else {
//           print('Response data does not contain expected keys.');
//         }
//       } else {
//         print('Failed to load data. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<MultiSelectItem<int>> siswaMultiSelectItems = siswaList
//         .map((item) => MultiSelectItem<int>(item['id'], item['nama']))
//         .toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text("Coba")),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               DropdownButtonFormField<int>(
//                 value: selectedJenisLayananId,
//                 items: jenisLayananList.map<DropdownMenuItem<int>>(
//                   (dynamic item) {
//                     return DropdownMenuItem<int>(
//                       value: item['id'],
//                       child: Text(item['jenis_layanan']),
//                     );
//                   },
//                 ).toList(),
//                 onChanged: (int? newValue) {
//                   setState(() {
//                     selectedJenisLayananId = newValue!;
//                     selectedSiswaIds.clear();
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Pilih Jenis Layanan',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               if (selectedJenisLayananId == 3)
//                 DropdownButtonFormField<String>(
//                   value: selectedJenisKarir,
//                   items: jenisKarirList.map<DropdownMenuItem<String>>(
//                     (dynamic item) {
//                       return DropdownMenuItem<String>(
//                         value: item['nama_jenis_karir'],
//                         child: Text(item['nama_jenis_karir']),
//                       );
//                     },
//                   ).toList(),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       selectedJenisKarir = newValue!;
//                     });
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'Pilih Jenis Karir',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               if (selectedJenisLayananId == 4)
//                 MultiSelectDialogField(
//                   title: Text('Pilih Siswa'),
//                   items: siswaMultiSelectItems,
//                   listType: MultiSelectListType.CHIP,
//                   onConfirm: (List<int> values) {
//                     setState(() {
//                       selectedSiswaIds = values;
//                     });
//                   },
//                   validator: (values) {
//                     if (values == null || values.isEmpty) {
//                       return 'Pilih setidaknya satu siswa';
//                     }
//                     return null;
//                   },
//                 ),
//               TextFormField(
//                 controller: _tempat,
//                 decoration: InputDecoration(
//                   labelText: "Tempat",
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Tempat tidak boleh kosong";
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _pesan,
//                 decoration: InputDecoration(
//                   labelText: "Pesan",
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Pesan tidak boleh kosong";
//                   }
//                   return null;
//                 },
//               ),
//               DateTimeField(
//                 format: DateFormat('HH:mm'),
//                 decoration: InputDecoration(
//                   labelText: 'Pilih Waktu',
//                   border: OutlineInputBorder(),
//                 ),
//                 onChanged: (time) {
//                   setState(() {
//                     selectedTime = time;
//                   });
//                 },
//                 onShowPicker: (context, currentValue) async {
//                   final time = await showTimePicker(
//                     context: context,
//                     initialTime: TimeOfDay.fromDateTime(
//                       currentValue ?? DateTime.now(),
//                     ),
//                   );
//                   return DateTimeField.convert(time);
//                 },
//               ),
//               TextFormField(
//                 readOnly: true,
//                 onTap: () {
//                   DatePicker.showDatePicker(
//                     context,
//                     showTitleActions: true,
//                     minTime: DateTime(2000, 1, 1),
//                     maxTime: DateTime(2100, 12, 31),
//                     onChanged: (date) {
//                       print('change $date');
//                     },
//                     onConfirm: (date) {
//                       setState(() {
//                         selectedDate = date;
//                       });
//                       print('confirm $date');
//                     },
//                     currentTime: selectedDate,
//                     locale: LocaleType.en,
//                   );
//                 },
//                 controller: TextEditingController(
//                   text: selectedDate != null
//                       ? DateFormat('yyyy-MM-dd').format(selectedDate!)
//                       : '',
//                 ),
//                 decoration: InputDecoration(
//                   labelText: 'Jadwal Konseling',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Pilih tanggal konseling';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     final String? bearerToken = await getBearerToken();

//                     if (bearerToken == null) {
//                       print('Bearer token is missing or null');
//                       // Handle the case where token is missing
//                       return;
//                     }

//                     final headers = {
//                       'Content-Type': 'application/json',
//                       'Accept': 'application/json',
//                       'Authorization': 'Bearer $bearerToken',
//                     };

//                     final Map<String, dynamic> requestData = {
//                       'id_layanan': selectedJenisLayananId,
//                       'tempat': _tempat.text,
//                       'pesan': _pesan.text,
//                       'jenis_karir': selectedJenisKarir,
//                       'jam_mulai': selectedTime != null
//                           ? DateFormat('HH:mm').format(selectedTime!)
//                           : null,
//                       'tanggal_konseling': selectedDate != null
//                           ? DateFormat('yyyy-MM-dd').format(selectedDate!)
//                           : null,
//                     };

//                     if (selectedSiswaIds.isNotEmpty) {
//                       requestData['teman'] = json.encode(selectedSiswaIds);
//                     }

//                     final response = await http.post(
//                       Uri.parse(
//                           'http://effective-ampland.gl.at.ply.gg:7440/api/store'),
//                       headers: headers,
//                       body: json.encode(requestData),
//                     );

//                     if (response.statusCode == 201) {
//                       print('Data successfully sent to the server.');
//                       // You can add further actions here, such as navigating to another screen or showing a success message.
//                     } else {
//                       print(
//                           'Failed to send data. Status code: ${response.statusCode}');
//                       // Handle the failure case, show an error message, etc.
//                     }
//                   }
//                 },
//                 child: Text("Save"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
