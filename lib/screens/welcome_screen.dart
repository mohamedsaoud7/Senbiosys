import 'package:flutter/material.dart';
import 'package:training/screens/create_account/email_screen.dart';
import 'package:training/screens/login/login_screen.dart';
import 'package:training/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/welcome_background.png',
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color(0x3307111F),
                  Color(0xF207111F),
                ],
                stops: [0, 0.55, 1],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 18, 22, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/ring_icon.png',
                        width: 22,
                        height: 22,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Welcome to Velia',
                        style: TextStyle(fontSize: 13, color: Colors.white70),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        color: Color(0xFFF3F2EF),
                        fontFamily: 'Cormorant Garamond',
                        fontWeight: FontWeight.w300,
                        fontSize: 56,
                        height: 0.93,
                        letterSpacing: -2.24,
                        fontFeatures: [
                          FontFeature.liningFigures(),
                          FontFeature.proportionalFigures(),
                        ],
                      ),
                      children: [
                        const TextSpan(text: 'Stay '),
                        const TextSpan(
                          text: 'connected',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        const TextSpan(text: '\nto everyday\nbalance'),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Gentle insights from a quiet\ncompanion that listens',
                    style: TextStyle(
                      color: Color(0xFF7D8593),
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 20),
                  AppButton(
                    text: 'Log in',
                    backgroundColor: const Color(0xFFF7F7F6),
                    foregroundColor: const Color(0xFF20232A),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (_) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  AppButton(
                    text: 'Create account',
                    backgroundColor: const Color(0xCC253043),
                    foregroundColor: const Color(0xFFE7E9ED),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (_) => const EmailScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
