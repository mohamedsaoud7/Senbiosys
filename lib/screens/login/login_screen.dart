import 'package:flutter/material.dart';
import 'package:training/screens/login/alcohol_use_screen.dart';
import 'package:training/widgets/app_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final PageController _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.68,
  );

  final List<String> _images = [
    'assets/login_carousel_3.png',
    'assets/login_carousel_1.png',
    'assets/login_carousel_2.png',
  ];

  final List<String> _titles = [
    'Take a breath',
    'Train your arteries',
    'Feed your heart',
  ];

  final List<String> _descriptions = [
    'Slow down and give your body time to recover.',
    'Move your body to keep your blood vessels flexible and your heart efficient.',
    'Choose foods that support your energy and heart health.',
  ];

  int _currentPage = 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF777983),
              Color(0xFF666873),
              Color(0xFF10192C),
              Color(0xFF020817),
            ],
            stops: [0, 0.13, 0.34, 1],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 21,
                    color: Color(0xFF9AA4B5),
                  ),
                ),
                const SizedBox(height: 4),
                const Row(
                  children: [
                    Icon(
                      Icons.rocket_launch_outlined,
                      size: 15,
                      color: Color(0xFFD9DCE2),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Most powerful tips',
                      style: TextStyle(fontSize: 13, color: Color(0xFFD9DCE2)),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                SizedBox(
                  height: 260,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _images.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      bool isSelected = index == _currentPage;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: isSelected ? 0 : 18,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(28),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(_images[index], fit: BoxFit.cover),
                              const DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0x665D5963),
                                      Color(0x44373A46),
                                      Color(0xD6070D1A),
                                    ],
                                    stops: [0, 0.45, 1],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 18,
                                left: 12,
                                right: 12,
                                child: Text(
                                  _titles[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 16,
                                right: 16,
                                bottom: 16,
                                child: Text(
                                  _descriptions[index],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    height: 1.35,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 80),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF101A2D).withValues(alpha: 0.82),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: const Color(0xFF263249)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 16,
                            color: Color(0xFFD9DCE2),
                          ),
                          SizedBox(width: 7),
                          Text(
                            'Your lifestyle',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 6,
                        runSpacing: 7,
                        children: [
                          _choice('Tobacco use  +'),
                          _choice(
                            'Alcohol use  +',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (_) => const AlcoholUseScreen(),
                                ),
                              );
                            },
                          ),
                          _choice('Physical activity  +'),
                          _choice('Stress levels  +'),
                          _choice('60 kg  ›'),
                          _choice('165 cm  ›'),
                          _choice('Female  ›'),
                          _choice('17.08.1995  ›'),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                AppButton(
                  text: 'Learn more',
                  backgroundColor: const Color(0xCC111C30),
                  foregroundColor: const Color(0xFFE7E9ED),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _choice(String text, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF172238),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFF29354B)),
        ),
        child: Text(text, style: const TextStyle(fontSize: 11)),
      ),
    );
  }
}
