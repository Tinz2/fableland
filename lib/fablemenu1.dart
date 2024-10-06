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
      home: fable1(),
    );
  }
}

//Class stateful เรียกใช้การท างานแบบโต้ตอบ (เรียกใช้ State)
class fable1 extends StatefulWidget {
  @override
  State<fable1> createState() => _MyHomePageState();
}

//class state เขียน Code ภาษา dart เพอื่รับค่าจากหนา้จอมาคา นวณและส่งคา่่กลบัไปแสดงผล
class _MyHomePageState extends State<fable1> {
  void _intialstate() {
    setState(() {});
  }

  @override
//ส่วนออกแบบหนา้จอ
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 241, 248, 100),
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
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft, // จัดข้อความชิดซ้าย
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0), // ปรับระยะห่างขอบซ้าย-ขวา
                  child: Text(
                    'กล่าวถึงหลากหลายเรื่องราว มักสะท้อนชีวิตและความเชื่อของผู้คนในสังคมนั้น เนื้อหาหลักๆ ',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
