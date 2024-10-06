import 'package:flutter/material.dart';
import 'webviewscreen.dart';
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
      home: fable4(),
    );
  }
}

//Class stateful เรียกใช้การท างานแบบโต้ตอบ (เรียกใช้ State)
class fable4 extends StatefulWidget {
  @override
  State<fable4> createState() => _MyHomePageState();
}

//class state เขียน Code ภาษา dart เพอื่รับค่าจากหนา้จอมาคา นวณและส่งคา่่กลบัไปแสดงผล
class _MyHomePageState extends State<fable4> {
  void _intialstate() {
    setState(() {});
  }

  final List<Map<String, String>> items = [ //เปลี่ยนรูปนิทานพื้นบ้าน
    {
      'text': 'Takumi',
      'image': 'assets/h1.jpg',
      'route': '/fable1', // ลิงก์ไปที่ fable01()
    },
    {
      'text': 'Bunta Fujiwara',
      'image': 'assets/h1.jpg',
      'route': '/fable2',
    },
    {
      'text': 'Keisuke Takahashi',
      'image': 'assets/h1.jpg',
      'route': '/fable3',
    },
    {
      'text': 'Ryousuke Takahashi',
      'image': 'assets/h1.jpg',
      'route': '/fable4',
    },
    {
      'text': 'Ryousuke Takahashi',
      'image': 'assets/h1.jpg',
      'route': '/fable4',
    },
  ];
  final List<Map<String, String>> items1 = [ //เปลี่ยนรูปนิทานคติสอนใจ
    {
      'text': 'Takumi',
      'image': 'assets/h1.jpg',
      'route': '/fable1', // ลิงก์ไปที่ fable01()
    },
    {
      'text': 'Bunta Fujiwara',
      'image': 'assets/h1.jpg',
      'route': '/fable2',
    },
    {
      'text': 'Keisuke Takahashi',
      'image': 'assets/h1.jpg',
      'route': '/fable3',
    },
    {
      'text': 'Ryousuke Takahashi',
      'image': 'assets/h1.jpg',
      'route': '/fable4',
    },
    {
      'text': 'Ryousuke Takahashi',
      'image': 'assets/h1.jpg',
      'route': '/fable4',
    },
  ];
  final List<Map<String, String>> items2 = [ //เปลี่ยนรูปนิทานก่อนนอน
    {
      'text': 'Takumi',
      'image': 'assets/h1.jpg',
      'route': '/fable1', // ลิงก์ไปที่ fable01()
    },
    {
      'text': 'Bunta Fujiwara',
      'image': 'assets/h1.jpg',
      'route': '/fable2',
    },
    {
      'text': 'Keisuke Takahashi',
      'image': 'assets/h1.jpg',
      'route': '/fable3',
    },
    {
      'text': 'Ryousuke Takahashi',
      'image': 'assets/h1.jpg',
      'route': '/fable4',
    },
    {
      'text': 'Ryousuke Takahashi',
      'image': 'assets/h1.jpg',
      'route': '/fable4',
    },
  ];
  final List<Map<String, String>> items3 = [ //เปลี่ยนรูปลิงก์คำแนะนำเพิ่มเติม
    {
      'text': 'Takumi Fujiwara',
      'image': 'assets/logo.png',
      'url': 'https://initiald.fandom.com/wiki/Takumi_Fujiwara',
    },
    {
      'text': 'Bunta Fujiwara',
      'image': 'assets/logo.png',
      'url': 'https://initiald.fandom.com/wiki/Bunta_Fujiwara',
    },
    {
      'text': 'Keisuke Takahashi',
      'image': 'assets/logo.png',
      'url': 'https://initiald.fandom.com/wiki/Keisuke_Takahashi?so=search',
    },
    {
      'text': 'Ryousuke Takahashi',
      'image': 'assets/logo.png',
      'url': 'https://initiald.fandom.com/wiki/Ryosuke_Takahashi?so=search',
    },
  ];
  @override
//ส่วนออกแบบหนา้จอ
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 241, 248, 100),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft, // จัดข้อความชิดซ้าย
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0), // ปรับระยะห่างขอบซ้าย-ขวา
              child: Text(
                'นิทานพื้นบ้าน',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 150, // กำหนดความสูงของ GridView
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.5,
              ),
              itemCount: items.length, // จำนวนรายการใน GridView
              itemBuilder: (context, index) {
                final item = items[index];
                return GestureDetector(
                  onTap: () {
                    if (item.containsKey('route')) {
                      // นำทางไปยังหน้าตามที่กำหนดใน route
                      Navigator.pushNamed(context, item['route']!);
                    }
                  },
                  child: SizedBox(
                    // ใช้ SizedBox เพื่อกำหนดขนาดของ Card
                    width: 50, // กำหนดความกว้างของ Card (ปรับตามที่ต้องการ)
                    child: Card(
                      elevation: 5,
                       shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // กำหนดมุมมนให้กับ Card
            ),
            color: const Color.fromARGB(255, 94, 255, 201), // สีพื้นหลังของการ์ด
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16), // ตัดมุมรูปภาพให้เป็นมุมมน
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            item['image']!, // แสดงรูปภาพจาก assets
                            height: 100,
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft, // จัดข้อความชิดซ้าย
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0), // ปรับระยะห่างขอบซ้าย-ขวา
              child: Text(
                'นิทานคติสอนใจ',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 150, // กำหนดความสูงของ GridView
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.5,
              ),
              itemCount: items1.length, // จำนวนรายการใน GridView
              itemBuilder: (context, index) {
                final item = items1[index];
                return GestureDetector(
                  onTap: () {
                    if (item.containsKey('route')) {
                      // นำทางไปยังหน้าตามที่กำหนดใน route
                      Navigator.pushNamed(context, item['route']!);
                    }
                  },
                  child: SizedBox(
                    // ใช้ SizedBox เพื่อกำหนดขนาดของ Card
                    width: 50, // กำหนดความกว้างของ Card (ปรับตามที่ต้องการ)
                    child: Card(
                      elevation: 5,
                       shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // กำหนดมุมมนให้กับ Card
            ),
            color: const Color.fromARGB(255, 94, 255, 201), // สีพื้นหลังของการ์ด
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16), // ตัดมุมรูปภาพให้เป็นมุมมน
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            item['image']!, // แสดงรูปภาพจาก assets
                            height: 100,
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                );
              },
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
          SizedBox(height: 10),
          SizedBox(
            height: 150, // กำหนดความสูงของ GridView
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.5,
              ),
              itemCount: items2.length, // จำนวนรายการใน GridView
              itemBuilder: (context, index) {
                final item = items2[index];
                return GestureDetector(
                  onTap: () {
                    if (item.containsKey('route')) {
                      // นำทางไปยังหน้าตามที่กำหนดใน route
                      Navigator.pushNamed(context, item['route']!);
                    }
                  },
                  child: SizedBox(
                    // ใช้ SizedBox เพื่อกำหนดขนาดของ Card
                    width: 50, // กำหนดความกว้างของ Card (ปรับตามที่ต้องการ)
                    child: Card(
                      elevation: 5,
                       shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // กำหนดมุมมนให้กับ Card
            ),
            color: const Color.fromARGB(255, 94, 255, 201), // สีพื้นหลังของการ์ด
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16), // ตัดมุมรูปภาพให้เป็นมุมมน
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            item['image']!, // แสดงรูปภาพจาก assets
                            height: 100,
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 20),
          
                        ],
                      ),
                    ),
                  ),
                ),
                
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft, // จัดข้อความชิดซ้าย
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0), // ปรับระยะห่างขอบซ้าย-ขวา
              child: Text(
                'คำแนะนำเพิ่มเติม',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
           SizedBox(
              height: 400, // ปรับความสูงของ GridView ที่สองให้เท่ากับอันแรก
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.1, // ปรับอัตราส่วนของ Card
                ),
                itemCount: items3.length,
                itemBuilder: (context, index) {
                  final item = items3[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              webviewscreen(url: item['url']!),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Card(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        elevation: 5,
                         shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // กำหนดมุมมนให้กับ Card
            ),
           
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16), // ตัดมุมรูปภาพให้เป็นมุมมน
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              item['image']!,
                              height: 175,
                              width: 175,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ),
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
