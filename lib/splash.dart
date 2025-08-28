import 'dart:async';
import 'package:bnsp/login.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    // Timer untuk navigasi setelah 5 detik
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 247, 240, 178),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.orangeAccent,
            radius: 100.0,
            child: Image.asset(
              'assets/mahasiswa.png',
              width: 150.0,
              height: 150.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}