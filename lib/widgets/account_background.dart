import 'package:flutter/material.dart';

class AccountBackground extends StatelessWidget {
  const AccountBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1B2D4B), Color(0xFF091427), Color(0xFF020715)],
            stops: [0, 0.38, 1],
          ),
        ),
        child: SafeArea(child: child),
      ),
    );
  }
}
