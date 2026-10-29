import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:training/providers/create_account_provider.dart';
import 'package:training/screens/create_account/height_screen.dart';
import 'package:training/widgets/account_background.dart';
import 'package:training/widgets/app_button.dart';

class BirthDateScreen extends StatelessWidget {
  const BirthDateScreen({super.key});

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
              'What is your date of\nbirth?',
              style: TextStyle(
                fontSize: 28,
                height: 1.05,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.8,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _DateField(
                    maxLength: 2,
                    autofocus: true,
                    onChanged: accountProvider.saveDay,
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: _DateField(
                    maxLength: 2,
                    onChanged: accountProvider.saveMonth,
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: _DateField(
                    maxLength: 4,
                    onChanged: accountProvider.saveYear,
                  ),
                ),
              ],
            ),
            const Spacer(),
            AppButton(
              text: 'Continue',
              backgroundColor: const Color(0xFFF8F8F7),
              foregroundColor: const Color(0xFF20232A),
              onPressed: () {
                FocusScope.of(context).unfocus();
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(builder: (_) => const HeightScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DateField extends StatelessWidget {
  const _DateField({
    required this.maxLength,
    required this.onChanged,
    this.autofocus = false,
  });

  final int maxLength;
  final bool autofocus;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autofocus,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      maxLength: maxLength,
      onChanged: onChanged,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        counterText: '',
        filled: true,
        fillColor: const Color(0xFF202B40),
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
