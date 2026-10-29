import 'package:flutter/material.dart';
import 'package:training/screens/create_account/final_onboarding_screen.dart';
import 'package:training/widgets/account_background.dart';
import 'package:training/widgets/app_button.dart';

class BatteryCheckScreen extends StatelessWidget {
  const BatteryCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AccountBackground(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints.tightFor(width: 32, height: 32),
              alignment: Alignment.centerLeft,
              icon: const Icon(
                Icons.arrow_back,
                size: 21,
                color: Color(0xFF8D98AA),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Double tap to\ncheck the battery',
              style: TextStyle(
                fontFamily: 'Cormorant Garamond',
                fontSize: 48,
                fontWeight: FontWeight.w300,
                height: 0.88,
                letterSpacing: -2.1,
              ),
            ),
            const SizedBox(height: 25),
            const Center(child: _RingImage()),
            const Spacer(),
            const Text(
              'That same double tap lets you check your\n'
              'battery without opening the app',
              style: TextStyle(
                color: Color(0xFFD4D7DD),
                fontSize: 14,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 10),
            const _BatteryLegend(),
            const SizedBox(height: 14),
            const _ProgressSteps(),
            const SizedBox(height: 14),
            AppButton(
              text: 'Continue',
              backgroundColor: const Color(0xFFF8F8F7),
              foregroundColor: const Color(0xFF20232A),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => const FinalOnboardingScreen(),
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

class _RingImage extends StatelessWidget {
  const _RingImage();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      height: 180,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/velia_ring.png', width: 210),
          Positioned(
            right: 14,
            bottom: 22,
            child: Icon(
              Icons.touch_app_outlined,
              size: 52,
              color: Colors.white.withValues(alpha: 0.18),
            ),
          ),
        ],
      ),
    );
  }
}

class _BatteryLegend extends StatelessWidget {
  const _BatteryLegend();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF202B40).withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _LightState(color: Color(0xFF62C963), label: 'Green'),
              _LightState(color: Color(0xFFD65353), label: 'Red'),
              _LightState(color: Color(0xFF7A8495), label: 'No light'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Charged', style: _legendTextStyle),
              Text('Below 30%', style: _legendTextStyle),
              Text('Time to recharge', style: _legendTextStyle),
            ],
          ),
        ],
      ),
    );
  }
}

class _LightState extends StatelessWidget {
  const _LightState({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 5),
        Text(label, style: _legendTextStyle),
      ],
    );
  }
}

const _legendTextStyle = TextStyle(color: Color(0xFFB9C0CB), fontSize: 11);

class _ProgressSteps extends StatelessWidget {
  const _ProgressSteps();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(6, (index) {
        final isActive = index < 4;

        return Expanded(
          child: Container(
            height: 1,
            margin: EdgeInsets.only(right: index == 5 ? 0 : 5),
            decoration: BoxDecoration(
              color: isActive
                  ? const Color(0xFFE6E8EC)
                  : const Color(0xFF455064),
              boxShadow: index == 3
                  ? const [BoxShadow(color: Color(0x99FFFFFF), blurRadius: 7)]
                  : null,
            ),
          ),
        );
      }),
    );
  }
}
