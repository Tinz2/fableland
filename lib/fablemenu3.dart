import 'package:flutter/material.dart';

//Method หลักทีRun
void main() {
  runApp(MyApp());
}

//Class state less สงั่ แสดงผลหนา้จอ
class MyApp extends StatelessWidget {
  const MyApp({super.key});
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '...',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(239, 245, 188, 2)),
        useMaterial3: true,
      ),
      home: fable3(),
    );
  }
}

//Class stateful เรียกใช้การท างานแบบโต้ตอบ (เรียกใช้ State)
class fable3 extends StatefulWidget {
  @override
  State<fable3> createState() => _MyHomePageState();
}

//class state เขียน Code ภาษา dart เพอื่รับค่าจากหนา้จอมาคา นวณและส่งคา่่กลบัไปแสดงผล
class _MyHomePageState extends State<fable3> {
  void _intialstate() {
    setState(() {});
  }

  List<Map<String, dynamic>> places = [
    {
      'name': 'นิทาน เงือกน้อยผจญภัย',
      'sound': 'เสียงพากษ์ไทย/อังกฤษ',
      'imagelist': 'assets/photo/11.jpg',
      'route': '/fable001',
    },
    {
      'name': 'นิทาน เจ้าหญิงนิทรา',
      'sound': 'เสียงพากษ์ไทย/อังกฤษ',
      'imagelist': 'assets/photo/12.jpg',
      'route': '/fable002',
    },
    {
      'name': 'นิทาน โฉมงามกับเจ้าชายอสูร',
      'imagelist': 'assets/photo/13.jpg',
      'route': '/fable003',
    },
    {
      'name': 'นิทาน สโนว์ไวท์กับคนแคระทั้งเจ็ด',
      'sound': 'เสียงพากษ์ไทย/อังกฤษ',
      'imagelist': 'assets/photo/14.jpg',
      'route': '/fable004',
    },
    {
      'name': 'นิทาน นางฟ้ากับดวงดาว',
      'sound': 'เสียงพากษ์ไทย/อังกฤษ',
      'imagelist': 'assets/photo/15.jpg',
      'route': '/fable005',
    },
  ];
  @override
//ส่วนออกแบบหนา้จอ
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(179, 228, 255, 100),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    'assets/photo/p4.jpg',
                    height: 200,
                    width: 350,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft, // จัดข้อความชิดซ้าย
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0), // ปรับระยะห่างขอบซ้าย-ขวา
                  child: Text(
                    'นิทานก่อนนอน',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft, // จัดข้อความชิดซ้าย
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0), // ปรับระยะห่างขอบซ้าย-ขวา
                  child: Text(
                    'นิทานก่อนนอน โดยเล่านิทานให้เด็กฟังก่อนนอนเพื่อเตรียมเด็กให้พร้อมสำหรับการนอนหลับ',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // ใส่ ListView.builder ตรงนี้
              SizedBox(
                height: 550, // กำหนดความสูงให้กับ ListView เพื่อไม่ให้บีบตัว
                child: ListView.builder(
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    final place = places[index];
                    return Card(
                      color: const Color.fromARGB(
                          255, 173, 252, 248), // สีพื้นหลังของ Card
                      elevation: 2.0, // ความนูน
                      shape: RoundedRectangleBorder(
                        // ความโค้งของมุม
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        height: 100, // เพิ่มความสูงของแต่ละ item
                        child: ListTile(
                          title: Row(
                            children: [
                              SizedBox(
                                width: 50,
                                height: 80,
                                child: Image.asset(
                                  place['imagelist'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      15), // เพิ่มระยะห่างระหว่างรูปภาพและข้อความ
                              Text(place['name']),
                            ],
                          ),
                          onTap: () {
                            if (place.containsKey('route')) {
                              // นำทางไปยังหน้าตามที่กำหนดใน route
                              Navigator.pushNamed(context, place['route']!);
                            }
                            //เมื่อกดที่ listview แล้วให้ขึ้นรายละเอียดต่างหรือไปหน้าอื่น ๆ
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ]),
      ),
    );
  }
}
