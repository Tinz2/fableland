import 'package:flutter/material.dart';

// Class สำหรับหน้า fable01
class fable02 extends StatelessWidget {
  const fable02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(175, 172, 255, 100),
        title: Text('Page 2')
       
      ),
       backgroundColor: Color.fromRGBO(58, 241, 248, 100),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('นิทานเรื่อง2'),
            SizedBox(height: 20),
            Text('นี่คือรายละเอียดเกี่ยวกับนิทานในหน้า 2'),
            // เพิ่มเนื้อหาอื่น ๆ ตามต้องการ
          ],
        ),
      ),
    );
  }
}