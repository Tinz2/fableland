import 'package:flutter/material.dart';

import 'webviewscreen.dart'; // สำหรับเปิด WebView

class home extends StatefulWidget {
  @override
  State<home> createState() => _HomePageState();
}

class _HomePageState extends State<home> {
  // Array สำหรับเก็บข้อมูลของ item
  final List<Map<String, String>> items = [
    {
      'text': 'นิทานเรื่องจระเข้สามพัน',
      'image': 'assets/photo/1.jpg',
      'route': '/fable1', // ลิงก์ไปที่ fable01()
    },
    {
      'text': 'นิทานเรื่องเศรษฐีกับยาจก',
      'image': 'assets/photo/2.jpg',
      'route': '/fable2',
    },
    {
      'text': 'นิทานเรื่องพญาคันคาก',
      'image': 'assets/photo/3.jpg',
      'route': '/fable3',
    },
    {
      'text': 'นิทานอีสป หมาจิ้งจอกตกบ่อ',
      'image': 'assets/photo/9.jpg',
      'route': '/fable4',
    },
  ];
  final List<Map<String, String>> items2 = [
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
                  'assets/h1.jpg',
                  height: 200,
                  width: 350,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'นิทานแนะนำ',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 320, // กาหนดความสูงของ GridView
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // แสดง 2 คอลัมน์ต่อแถว
                  crossAxisSpacing: 20.0, // ระยะห่างระหว่างคอลัมน์
                  mainAxisSpacing: 10.0, // ระยะห่างระหว่างแถว
                  childAspectRatio: 1.4,
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
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(16), // กำหนดมุมมนให้กับ Card
                      ),
                      color: const Color.fromARGB(
                          255, 173, 252, 248), // สีพื้นหลังของการ์ด
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            16), // ตัดมุมรูปภาพให้เป็นมุมมน

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              item['image']!, // แสดงรูปภาพจาก assets
                              height: 100,
                              width: 200,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(height: 10),
                            Text(
                              item['text']!, // แสดงข้อความ
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, bottom: 8.0), // ปรับ padding
              child: Text(
                'คำแนะนำเพิ่มเติม',
                style: TextStyle(
                  fontSize: 24,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 400, // ปรับความสูงของ GridView ที่สองให้เท่ากับอันแรก
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.1, // ปรับอัตราส่วนของ Card
                ),
                itemCount: items2.length,
                itemBuilder: (context, index) {
                  final item = items2[index];
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
                          borderRadius: BorderRadius.circular(
                              16), // กำหนดมุมมนให้กับ Card
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              16), // ตัดมุมรูปภาพให้เป็นมุมมน
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
          ],
        ),
      ),
    );
  }
}
