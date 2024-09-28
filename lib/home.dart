import 'package:flutter/material.dart';
import 'fable1.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _HomePageState();
}

class _HomePageState extends State<home> {
  final List<Map<String, String>> images = [
    {'url': 'assets/h1.jpg', 'route': '/fable1'}, // รูปที่ 1
    {'url': 'assets/h1.jpg', 'route': '/page2'}, // รูปที่ 2
  ];

  @override
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
            Center(
              child: Text(
                'นิทานแนะนำ',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // รูปชิดซ้าย
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/fable1');
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
          ],
        ),
      ),
    );
  }
}