import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/providers/create_account_provider.dart';
import 'package:training/providers/password_provider.dart';
import 'package:training/screens/create_account/birth_date_screen.dart';
import 'package:training/widgets/account_background.dart';
import 'package:training/widgets/app_button.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<CreateAccountProvider>(
      context,
      listen: false,
    );

    return ChangeNotifierProvider(
      create: (_) => PasswordProvider(),
      child: Consumer<PasswordProvider>(
        builder: (context, passwordProvider, child) {
          return AccountBackground(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
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
                  const SizedBox(height: 24),
                  const Text(
                    'Set up a password',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.8,
                    ),
                  ),
                  const Text(
                    'Must be at least 8 characters',
                    style: TextStyle(fontSize: 13, color: Color(0xFF6E7789)),
                  ),
                  const SizedBox(height: 18),
                  TextField(
                    autofocus: true,
                    obscureText: passwordProvider.obscurePassword,
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      passwordProvider.updatePassword(value);
                      accountProvider.savePassword(value);
                    },
                    style: const TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        color: Color(0xFF6E7789),
                        fontSize: 13,
                      ),
                      filled: true,
                      fillColor: const Color(0xFF202B40),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          passwordProvider.togglePasswordVisibility();
                        },
                        icon: Icon(
                          passwordProvider.obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 20,
                          color: const Color(0xFF5C6577),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _PasswordRule(
                              text: '1 lowercase letter',
                              isValid: passwordProvider.hasLowercase,
                            ),
                            _PasswordRule(
                              text: '1 number',
                              isValid: passwordProvider.hasNumber,
                            ),
                            _PasswordRule(
                              text: '1 uppercase letter',
                              isValid: passwordProvider.hasUppercase,
                            ),
                            _PasswordRule(
                              text: '1 special character',
                              isValid: passwordProvider.hasSpecialCharacter,
                            ),
                            _PasswordRule(
                              text: '8 characters',
                              isValid: passwordProvider.hasMinimumLength,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Password strength',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF6E7789),
                            ),
                          ),
                          Text(
                            passwordProvider.strengthLabel,
                            style: TextStyle(
                              fontSize: 12,
                              color: _strengthColor(
                                passwordProvider.strengthLabel,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  AppButton(
                    text: 'Continue',
                    backgroundColor: const Color(0xFFF8F8F7),
                    foregroundColor: const Color(0xFF20232A),
                    onPressed: passwordProvider.isValid
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (_) => const BirthDateScreen(),
                              ),
                            );
                          }
                        : null,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Color _strengthColor(String strength) {
    if (strength == 'Weak') return const Color(0xFFD56C6C);
    if (strength == 'Fair') return const Color(0xFFD4A45D);
    if (strength == 'Good') return const Color(0xFF8FA8D1);
    if (strength == 'Strong') return const Color(0xFF68AFA4);
    return const Color(0xFF58A88F);
  }
}

class _PasswordRule extends StatelessWidget {
  const _PasswordRule({required this.text, required this.isValid});

  final String text;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    Color color = const Color(0xFF6E7789);

    if (isValid) {
      color = const Color(0xFFD7DBE2);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check, size: 13, color: color),
          const SizedBox(width: 3),
          Text(text, style: TextStyle(fontSize: 12, color: color)),
        ],
      ),
    );
  }
}
