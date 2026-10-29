import 'package:flutter/material.dart';
import 'package:training/widgets/account_background.dart';
import 'package:training/widgets/app_button.dart';

class FinalOnboardingScreen extends StatefulWidget {
  const FinalOnboardingScreen({super.key});

  @override
  State<FinalOnboardingScreen> createState() => _FinalOnboardingScreenState();
}

class _FinalOnboardingScreenState extends State<FinalOnboardingScreen> {
  final PageController _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.5,
  );

  final List<String> _images = [
    'assets/carousel_1.png',
    'assets/carousel_2.png',
    'assets/carousel_3.png',
  ];

  int _currentPage = 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
            const SizedBox(height: 24),
            const Text(
              'Only what\nmatters, when it\nmatters',
              style: TextStyle(
                fontFamily: 'Cormorant Garamond',
                fontSize: 52,
                fontWeight: FontWeight.w300,
                height: 0.9,
                letterSpacing: -2.1,
              ),
            ),
            const SizedBox(height: 28),
            SizedBox(
              height: 150,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _images.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final isSelected = index == _currentPage;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: isSelected ? 0 : 14,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      image: DecorationImage(
                        image: AssetImage(_images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            const Text(
              'Velia learns over time, unlocking more tailored\n'
              'insights as it calibrates.',
              style: TextStyle(
                color: Color(0xFFD4D7DD),
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: List.generate(5, (index) {
                return Expanded(
                  child: Container(
                    height: 1,
                    margin: EdgeInsets.only(right: index == 4 ? 0 : 6),
                    color: const Color(0xFFE6E8EC),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            AppButton(
              text: 'Start using Velia',
              backgroundColor: const Color(0xFFF8F8F7),
              foregroundColor: const Color(0xFF20232A),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
