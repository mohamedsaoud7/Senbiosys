import 'package:flutter/material.dart';
import 'package:training/screens/create_account/ring_dock_screen.dart';
import 'package:training/widgets/account_background.dart';
import 'package:training/widgets/app_button.dart';

class ChargingStationScreen extends StatelessWidget {
  const ChargingStationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AccountBackground(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
        child: Column(
          children: [
            const Spacer(flex: 3),
            Image.asset(
              'assets/charging_station.png',
              width: 270,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 22),
            const Text(
              'Let’s start',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.8,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Connect the charging station to a good quality\n'
              'power adapter using the USB-C cable.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF737C8D),
                fontSize: 13,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                style: TextStyle(
                  color: Color(0xFF737C8D),
                  fontSize: 13,
                  height: 1.4,
                ),
                children: [
                  TextSpan(
                    text: 'The light on the top of the charging station will\n',
                  ),
                  TextSpan(
                    text: 'glow a steady green when it’s ready.',
                    style: TextStyle(color: Color(0xFFD7DBE2)),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 2),
            AppButton(
              text: 'Connect your ring',
              backgroundColor: const Color(0xFFF8F8F7),
              foregroundColor: const Color(0xFF20232A),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => const RingDockScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            AppButton(
              text: 'Connect later',
              backgroundColor: const Color(0xCC202B40),
              foregroundColor: const Color(0xFFE7E9ED),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
