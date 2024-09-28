import 'package:fableland_application/fable1.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'fablemenu1.dart';
import 'fablemenu2.dart';
import 'fablemenu3.dart';
import 'fablemenu4.dart';

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
      home: menu(),
    );
  }
}

//Class stateful เรียกใช้การท างานแบบโต้ตอบ (เรียกใช้ State)
class menu extends StatefulWidget {
  @override
  State<menu> createState() => _MyHomePageState();
}

//class state เขียน Code ภาษา dart เพอื่รับค่าจากหนา้จอมาคา นวณและส่งคา่่กลบัไปแสดงผล
class _MyHomePageState extends State<menu> {
  void _intialstate() {
    setState(() {});
  }

//ประกาศตวัแปรเกบ็ลา ดบัของหนา้จอ
  int _currentIndex = 0;
// สร้างตวัแปรอาร์เรยเ์พื่อเกบ็ รายการของหนา้จอที่ตอ้งการสลบัไปเมื่อเลือกแต่ละแทบ็
  final List<Widget> _screens = [
    home(),
    fable1(),
    fable2(),
    fable3(),
    fable4(),
    fable01(),
  ];
// สร้างฟังกช์ นั ที่ใชส้ลบั หนา้จอเมื่อผใู้ชเ้ลือกแทบ็
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
//ส่วนออกแบบหนา้จอ
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(175, 172, 255, 100),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo.png'),
        ),
      ),
      body: _screens[_currentIndex], // แสดงหน้าจอที่ถูกเลือกตามค่าในอาร์เรย์
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, //ล าดับของแท็บที่ถูกเลือก
        onTap: _onTabTapped, // ฟังกช์ นั ที่เรียกเมื่อกดแต่ละแทบ็
        items: [
          //กา หนดจา นวนBottomNavigationBarItemเท่ากบัจา นวนเมนูดา้นลา่ งที่ตอ้การ
          BottomNavigationBarItem(
            icon: Icon(Icons.home), //กา หนดรูปแบบไอคอนของแต่ละแท็ป
            label: 'Home', //กา หนดชื่อแทป็ ที่ตอ้งการ
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'FABLE1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'FABLE2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'FABLE3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'FABLE4',
          ),
        ],
        type:
            BottomNavigationBarType.fixed, // คงที่เพื่อให้ทุกแท็บมีขนาดเท่ากัน

        // ตั้งค่าพื้นหลังเป็นสีดำ
        backgroundColor: const Color.fromRGBO(175, 172, 255, 100),

        // กำหนดสีของไอคอนและ label เมื่อเลือก
        selectedItemColor: const Color.fromARGB(255, 63, 63, 63),

        // กำหนดสีของไอคอนและ label เมื่อยังไม่ได้เลือก
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),

        // ปรับขนาดของไอคอน
        selectedIconTheme: IconThemeData(size: 30),
        unselectedIconTheme: IconThemeData(size: 24),
      ),
    );
  }
}
