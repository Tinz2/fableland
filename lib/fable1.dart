import 'package:flutter/material.dart';
import 'home.dart';
import 'menu.dart';
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
      home: fable01(),
    );
  }
}

class fable01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Page 1!'),
            SizedBox(height: 20),
            Text('นี่คือรายละเอียดเกี่ยวกับนิทานในหน้า 1'),
            // เพิ่มเนื้อหาอื่น ๆ ตามต้องการ
          ],
        ),
      ),
    );
  }
}
   
