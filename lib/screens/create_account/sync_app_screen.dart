import 'package:flutter/material.dart';
import 'package:training/screens/create_account/battery_check_screen.dart';
import 'package:training/widgets/account_background.dart';
import 'package:training/widgets/app_button.dart';

class SyncAppScreen extends StatelessWidget {
  const SyncAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AccountBackground(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text(
              'Open your app\nto sync',
              style: TextStyle(
                fontFamily: 'Cormorant Garamond',
                fontSize: 54,
                fontWeight: FontWeight.w300,
                height: 0.9,
                letterSpacing: -2.2,
              ),
            ),
            const SizedBox(height: 55),
            Center(
              child: Container(
                width: 160,
                height: 160,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF1C273A).withValues(alpha: 0.45),
                  borderRadius: BorderRadius.circular(38),
                  border: Border.all(
                    color: const Color(0xFF71809A).withValues(alpha: 0.18),
                  ),
                ),
                child: Opacity(
                  opacity: 0.16,
                  child: Image.asset('assets/ring_icon.png', width: 105),
                ),
              ),
            ),
            const Spacer(),
            const Text(
              'Regular syncing helps build patterns over time,\n'
              'making your insights more meaningful. Sync at\n'
              'least every 2 days to avoid losing data.',
              style: TextStyle(
                color: Color(0xFFD4D7DD),
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _progressPart(const Color(0xFFE6E8EC)),
                const SizedBox(width: 6),
                _progressPart(const Color(0xFFE6E8EC)),
                const SizedBox(width: 6),
                _progressPart(const Color(0xFF455064)),
                const SizedBox(width: 6),
                _progressPart(const Color(0xFF455064)),
                const SizedBox(width: 6),
                _progressPart(const Color(0xFF455064)),
              ],
            ),
            const SizedBox(height: 20),
            AppButton(
              text: 'Continue',
              backgroundColor: const Color(0xFFF8F8F7),
              foregroundColor: const Color(0xFF20232A),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => const BatteryCheckScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _progressPart(Color color) {
    return Expanded(child: Container(height: 1, color: color));
  }
}
