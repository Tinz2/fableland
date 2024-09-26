import 'package:flutter/material.dart';
import 'fable1.dart';
// Method หลักที่ Run
void main() {
  runApp(MyApp());
}

// Class stateless สำหรับแสดงผลหน้าจอ
// Class stateless สำหรับแสดงผลหน้าจอ
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
       
        '/fable1': (context) => fable01(),
        
      },
    );
  }
}

// Class stateful สำหรับจัดการ state
class home extends StatefulWidget {
  @override
  State<home> createState() => _MyHomePageState();
}

// class state สำหรับการทำงาน
class _MyHomePageState extends State<home> {
  final List<Map<String, String>> images = [
    {'url': 'assets/h1.jpg', 'route': '/fable1'}, // รูปที่ 1
    {'url': 'assets/h1.jpg', 'route': '/page2'}, // รูปที่ 2
  ];

  @override
  // ส่วนออกแบบหน้าจอ
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 241, 248, 100),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20), // เพิ่มระยะห่างจากขอบบน
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0), // ตั้งค่ารัศมีมุมโค้งมน
                  child: Image.asset(
                    'assets/h1.jpg', // ใช้ชื่อไฟล์และพาธรูปภาพของคุณ
                    height: 200, // ตั้งค่าความสูงของรูป
                    width: 350, // ตั้งค่าความกว้างของรูป
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 20), // เพิ่มระยะห่างระหว่างรูปกับข้อความ
              Center(
                child: Text(
                  'นิทานแนะนำ',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0), // สีของข้อความ
                    fontSize: 24, // ขนาดของฟอนต์
                  ),
                ),
              ),
              SizedBox(height: 20), // เพิ่มระยะห่างจากขอบบน
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // รูปชิดซ้าย
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, images[0]['route']!);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          images[0]['url']!,
                          height: 100,
                          width: 200,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),

                  // รูปชิดขวา
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, images[1]['route']!);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          images[1]['url']!,
                          height: 100,
                          width: 200,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}