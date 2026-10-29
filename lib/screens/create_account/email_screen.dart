import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/providers/create_account_provider.dart';
import 'package:training/screens/create_account/password_screen.dart';
import 'package:training/widgets/account_background.dart';
import 'package:training/widgets/app_button.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<CreateAccountProvider>(
      context,
      listen: false,
    );

    return AccountBackground(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _backButton(context),
            const SizedBox(height: 24),
            const Text(
              'Let’s get started',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.8,
              ),
            ),
            const Text(
              'We will send you an email to confirm it',
              style: TextStyle(fontSize: 13, color: Color(0xFF6E7789)),
            ),
            const SizedBox(height: 18),
            TextField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              autocorrect: false,
              onChanged: (value) {
                accountProvider.saveEmail(value);
              },
              style: const TextStyle(fontSize: 16),
              decoration: _fieldDecoration(),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(top: 12),
                foregroundColor: const Color(0xFF557CB9),
              ),
              child: const Text(
                'Already have an account? Log in',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              ),
            ),
            const Spacer(),
            AppButton(
              text: 'Continue',
              backgroundColor: const Color(0xFFF8F8F7),
              foregroundColor: const Color(0xFF20232A),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => const PasswordScreen(),
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

Widget _backButton(BuildContext context) {
  return IconButton(
    onPressed: () => Navigator.pop(context),
    padding: EdgeInsets.zero,
    constraints: const BoxConstraints.tightFor(width: 32, height: 32),
    alignment: Alignment.centerLeft,
    icon: const Icon(Icons.arrow_back, size: 21, color: Color(0xFF8D98AA)),
  );
}

InputDecoration _fieldDecoration() {
  return InputDecoration(
    filled: true,
    fillColor: const Color(0xFF202B40),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
  );
}
