import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Jadwal extends StatefulWidget {
  const Jadwal({Key? key}) : super(key: key);

  @override
  State<Jadwal> createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  TextEditingController dateInput = TextEditingController();

  String selectedValue1 = "jenis";
  List<DropdownMenuItem<String>> get JenisLayanan {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Pilih Jenis Layanan"), value: "jenis"),
      DropdownMenuItem(child: Text("Bimbingan Pribadi"), value: "Pribadi"),
      DropdownMenuItem(child: Text("Bimbingan Belajar"), value: "Belajar"),
      DropdownMenuItem(child: Text("Bimbingan Karir"), value: "Karir"),
      DropdownMenuItem(child: Text("Bimbingan Sosial"), value: "Sosial"),
    ];
    return menuItems;
  }

  String selectedValue2 = "Pilih Teman";
  List<DropdownMenuItem<String>> get NamaTeman {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Pilih Teman"), value: "Pilih Teman"),
      DropdownMenuItem(child: Text("Placeholder"), value: "Placeholder"),
      DropdownMenuItem(child: Text("Placeholder"), value: "Placeholder"),
      DropdownMenuItem(child: Text("Placeholder"), value: "Placeholder"),
    ];
    return menuItems;
  }

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

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
                      top: constraints.maxHeight * 0.14,
                      left: constraints.maxWidth * 0.25,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/meeting.png',
                            height: constraints.maxHeight * 0.20,
                          ),
                          Text(
                            'Arrange Meeting',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: constraints.maxWidth * 0.065,
                            ),
                          )
                        ],
                      ),
                    ),
                    Form(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.fromLTRB(
                          constraints.maxWidth * 0.1,
                          constraints.maxHeight * 0.5,
                          constraints.maxWidth * 0.1,
                          0,
                        ),
                        child: Column(
                          children: [
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 255, 255),
                              ),
                              dropdownColor: Color.fromARGB(255, 255, 255, 255),
                              value: selectedValue1,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue1 = newValue!;
                                });
                              },
                              items: JenisLayanan,
                            ),
                            SizedBox(height: constraints.maxHeight * 0.05),
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 255, 255),
                              ),
                              dropdownColor: Color.fromARGB(255, 255, 255, 255),
                              value: selectedValue2,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue2 = newValue!;
                                });
                              },
                              items: NamaTeman,
                            ),
                            SizedBox(height: constraints.maxHeight * 0.05),
                            Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 49, 78, 207),
                                  borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Tanggal dan Waktu',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          onPressed: () {
                                            DatePicker.showDatePicker(
                                              context,
                                              showTitleActions: true,
                                              minTime: DateTime(2023, 1, 1),
                                              maxTime: DateTime(2025, 1, 1),
                                              onChanged: (date) {
                                                print('change $date');
                                              },
                                              onConfirm: (date) {
                                                print('confirm $date');
                                              },
                                              currentTime: DateTime.now(),
                                              locale: LocaleType.id,
                                            );
                                          },
                                          child: Text(
                                            'Buka Kalender',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                0,
                                                0,
                                                0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.05),
                            Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 49, 78, 207),
                                  borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Tempat Konseling',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Masukan Lokasi...',
                                            fillColor: Colors.white,
                                            filled: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.05),
                            Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 49, 78, 207),
                                  borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Topik Pembicaraan',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Masukan Topik...',
                                            fillColor: Colors.white,
                                            filled: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.07),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 255, 195, 3),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: constraints.maxWidth * 0.15,
                                    vertical: constraints.maxHeight * 0.02,
                                  ),
                                  child: Text('SUBMIT'),
                                ),
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.07),
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
