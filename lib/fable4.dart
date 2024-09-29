import 'package:flutter/material.dart';

// Class สำหรับหน้า fable01
class fable04 extends StatelessWidget {
  const fable04({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(175, 172, 255, 100),
        title: Text('Page 4')
       
      ),
       backgroundColor: Color.fromRGBO(58, 241, 248, 100),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('นิทานเรื่อง4'),
            SizedBox(height: 20),
            Text('นี่คือรายละเอียดเกี่ยวกับนิทานในหน้า 4'),
            // เพิ่มเนื้อหาอื่น ๆ ตามต้องการ
          ],
        ),
      ),
    );
  }
}