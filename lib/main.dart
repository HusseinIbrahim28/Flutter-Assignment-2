import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(const Gdsc());
}

class Gdsc extends StatelessWidget {
  const Gdsc({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gdsc Task',
      home: Loginscreen(),
    );
  }
}
