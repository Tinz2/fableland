import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'menu.dart';
import 'home.dart';
import 'fable1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '....',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(239, 245, 188, 2)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WaitScreen(),
        '/menu': (context) => menu(),
        '/home': (context) => home(),
        '/fable1': (context) => fable01(),
      },
    );
  }
}

class WaitScreen extends StatefulWidget {
  @override
  State<WaitScreen> createState() => _WaitScreenState();
}

class _WaitScreenState extends State<WaitScreen> {
  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacementNamed(context, '/menu');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              'assets/lottie/title.json',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            Text(
              'INITIAL Donkdjfojhojhsdfh',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}