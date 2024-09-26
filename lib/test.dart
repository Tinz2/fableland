import 'package:flutter/material.dart';
import 'test2.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ImageGrid(),
        '/page1': (context) => Page1(),
        
      },
    );
  }
}
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Clickable Images Example'),
        ),
        body: ImageGrid(),
      ),
    );
  }


class ImageGrid extends StatelessWidget {
  final List<Map<String, String>> images = [
    {'url': 'assets/h1.jpg', 'route': '/page1'},
    {'url': 'assets/h1.jpg', 'route': '/page2'},
    {'url': 'assets/h1.jpg', 'route': '/page3'},
    // เพิ่มเติมรูปภาพได้ที่นี่
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1, // ปรับอัตราส่วนตามต้องการ
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0), // เพิ่มระยะห่างรอบๆ
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, images[index]['route']!);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15), // กำหนดขอบมน
              child: Image.asset(
                images[index]['url']!,
                fit: BoxFit.cover, // ปรับขนาดภาพให้เต็มพื้นที่
              ),
            ),
          ),
        );
      },
    );
  }
}