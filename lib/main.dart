import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 103, 53, 188)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 10;
  Timer? _timer;

  void _startTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    _counter = 10;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 103, 53, 188),
        title: const Text(
          'Timer',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            (_counter > 0)
                ? const Text('')
                : const Text(
                    "Done!",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            Text(
              '$_counter',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 118,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 103, 53, 188),
                padding: const EdgeInsets.all(20),
              ),
              onPressed: _startTimer,
              child: const Text(
                'Start 10 Second Countdown',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
