import 'package:flutter/material.dart';
import 'package:training/widgets/account_background.dart';
import 'package:training/widgets/app_button.dart';

class AlcoholUseScreen extends StatefulWidget {
  const AlcoholUseScreen({super.key});

  @override
  State<AlcoholUseScreen> createState() => _AlcoholUseScreenState();
}

class _AlcoholUseScreenState extends State<AlcoholUseScreen> {
  int selectedOption = 0;

  final List<String> options = [
    'Never',
    'Occasionally',
    '1–2 times per week',
    '3–5 times per week',
    'Daily',
  ];

  final List<String> details = ['', 'Less than once per week', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return AccountBackground(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.close,
                  size: 20,
                  color: Color(0xFF9AA4B5),
                ),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Do you currently\ndrink alcohol?',
              style: TextStyle(
                fontSize: 26,
                height: 1.05,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView.separated(
                itemCount: options.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = index;
                      });
                    },
                    child: Container(
                      height: 68,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF101A2D).withValues(alpha: 0.85),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: const Color(0xFF222E43)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  options[index],
                                  style: const TextStyle(fontSize: 13),
                                ),
                                if (details[index].isNotEmpty) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    details[index],
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF6E7789),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          Icon(
                            selectedOption == index
                                ? Icons.radio_button_checked
                                : Icons.radio_button_unchecked,
                            color: selectedOption == index
                                ? const Color(0xFFD8DCE4)
                                : const Color(0xFF243047),
                            size: 21,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            AppButton(
              text: 'Continue',
              backgroundColor: const Color(0xFFF8F8F7),
              foregroundColor: const Color(0xFF20232A),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
