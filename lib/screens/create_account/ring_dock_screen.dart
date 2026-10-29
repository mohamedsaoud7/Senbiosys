import 'package:flutter/material.dart';
import 'package:training/screens/create_account/sync_app_screen.dart';
import 'package:training/widgets/account_background.dart';
import 'package:training/widgets/app_button.dart';

class RingDockScreen extends StatelessWidget {
  const RingDockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AccountBackground(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints.tightFor(
                  width: 32,
                  height: 32,
                ),
                alignment: Alignment.centerLeft,
                icon: const Icon(
                  Icons.arrow_back,
                  size: 21,
                  color: Color(0xFF8D98AA),
                ),
              ),
            ),
            const Spacer(flex: 2),
            Image.asset(
              'assets/ring_dock.png',
              height: 190,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),
            const Text(
              'Place your ring on\nthe charger',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                height: 1.05,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.8,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Align the Velia logo with the dot on the charger.\n'
              'This is how you’ll charge your ring.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF737C8D),
                fontSize: 13,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Make sure that bluetooth is enabled on your\n'
              'phone. When the green lights begin to glow\n'
              'inside the ring, tap ‘Continue’.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF737C8D),
                fontSize: 13,
                height: 1.4,
              ),
            ),
            const Spacer(flex: 2),
            AppButton(
              text: 'Continue',
              backgroundColor: const Color(0xFFF8F8F7),
              foregroundColor: const Color(0xFF20232A),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => const SyncAppScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
