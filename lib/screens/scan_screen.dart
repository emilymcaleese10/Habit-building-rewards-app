import 'package:flutter/material.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/Primary Logo Simplified.png',
            height: 40),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffe5e5e5),
      body: const Center(
        child: Text('Scan Screen'),
      ),
    );
  }
}

