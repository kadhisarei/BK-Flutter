import 'package:bk_flutter/apa.dart';
import 'package:bk_flutter/layanan.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Homes extends StatefulWidget {
  const Homes({super.key});

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  late SharedPreferences preferences;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getuserData();
  }

  void getuserData() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    final widthApp = MediaQuery.of(context).size.width;
    final heightApp = MediaQuery.of(context).size.height;
    final paddingTop = MediaQuery.of(context).padding.top;
    final heightBody = heightApp - paddingTop;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 78, 207),
      body: SingleChildScrollView(
        child: Container(
          width: widthApp,
          height: heightApp,
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Container(
                      height: paddingTop,
                      color: Colors.transparent,
                    ),
                    Container(
                      height: heightBody * 0.1,
                      child: Row(
                        children: [
                          SizedBox(width: widthApp * 0.05),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.black,
                          ),
                          SizedBox(width: widthApp * 0.04),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Selamat Datang',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                '${preferences.getString('name').toString()}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.notifications_active_outlined),
                            color: Colors.white,
                            onPressed: () {
                              print("tapped");
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: heightBody * 0.035),
                    Container(
                      height: heightApp * 0.21,
                      width: widthApp * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/images/a.jpg'),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    SizedBox(height: heightBody * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: widthApp * 0.06),
                          child: Text(
                            "Kategori Konseling",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: heightBody * 0.02),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // Ubah menjadi MainAxisAlignment.spaceBetween
                        children: [
                          CategoryBox(
                            name: "Pribadi",
                            color: Color.fromARGB(255, 251, 174, 71),
                            icon: Icons.person,
                          ),
                          SizedBox(
                              width: widthApp *
                                  0.07), // Tambahkan jarak antara kotak
                          CategoryBox(
                            name: "Karir",
                            color: Color.fromARGB(255, 241, 93, 83),
                            icon: Icons.work,
                          ),
                          SizedBox(
                              width: widthApp *
                                  0.07), // Tambahkan jarak antara kotak
                          CategoryBox(
                            name: "Sosial",
                            color: Color.fromARGB(255, 135, 196, 107),
                            icon: Icons.people,
                          ),
                          SizedBox(
                              width: widthApp *
                                  0.07), // Tambahkan jarak antara kotak
                          CategoryBox(
                            name: "Lainnya",
                            color: Color.fromARGB(255, 86, 102, 196),
                            icon: Icons.category_sharp,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: heightBody * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: widthApp * 0.06),
                          child: Text(
                            "Jadwal Mendatang",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: widthApp * 0.06),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Layanan()),
                                  );
                            },
                            child: Text(
                              "Lihat Semua",
                              style: TextStyle(
                                color: Color.fromARGB(255, 251, 174, 71),
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: heightBody * 0.025),
                    Container(
                      width: widthApp * 0.8,
                      height: heightBody * 0.25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: heightBody * 0.03),
                          Row(
                            children: [
                              SizedBox(width: widthApp * 0.04),
                              CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.black,
                                child: Center(
                                  child: Icon(
                                    Icons.person,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: widthApp * 0.04),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Mr. Ricky Sudrajat',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: heightBody * 0.01),
                                  Text(
                                    'Bimbingan Konseling',
                                    style: TextStyle(
                                      color: Color(0xFF2562D8),
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: heightBody * 0.02),
                          Divider(
                            color: Color.fromRGBO(52, 52, 52, 0.5),
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                          ),
                          Row(
                            children: [
                              SizedBox(width: widthApp * 0.05),
                              Container(
                                child: Icon(
                                  Icons.calendar_month_sharp,
                                  size: 25,
                                ),
                              ),
                              SizedBox(width: widthApp * 0.02),
                              Text(
                                "Saturday, 5 June",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: heightBody * 0.01),
                          Row(
                            children: [
                              SizedBox(width: widthApp * 0.05),
                              Container(
                                child: Icon(
                                  Icons.access_time_filled_outlined,
                                  size: 25,
                                ),
                              ),
                              SizedBox(width: widthApp * 0.02),
                              Text(
                                "12:00 - 14:00",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     print("Floating Action Button ditekan");
      //   },
      //   child: Icon(Icons.calendar_month_outlined),
      //   backgroundColor: Color.fromARGB(255, 255, 195, 3),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class CategoryBox extends StatelessWidget {
  final String name;
  final Color color;
  final IconData icon;

  const CategoryBox(
      {required this.name, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    final boxSize = MediaQuery.of(context).size.width * 0.17;

    return Column(
      children: [
        Container(
          width: boxSize,
          height: boxSize,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: boxSize * 0.5,
          ),
        ),
        SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
