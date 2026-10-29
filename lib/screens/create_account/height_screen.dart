import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/providers/create_account_provider.dart';
import 'package:training/screens/create_account/charging_station_screen.dart';
import 'package:training/widgets/account_background.dart';
import 'package:training/widgets/app_button.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  bool _useMetric = false;
  int _selectedFeet = 5;
  int _selectedInches = 7;
  int _selectedCentimeters = 170;
  late final FixedExtentScrollController _feetController;
  late final FixedExtentScrollController _inchesController;
  late final FixedExtentScrollController _centimetersController;

  @override
  void initState() {
    super.initState();
    _feetController = FixedExtentScrollController(initialItem: 3);
    _inchesController = FixedExtentScrollController(initialItem: 7);
    _centimetersController = FixedExtentScrollController(initialItem: 70);
  }

  @override
  void dispose() {
    _feetController.dispose();
    _inchesController.dispose();
    _centimetersController.dispose();
    super.dispose();
  }

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
            Row(
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
                const SizedBox(width: 26),
                const Expanded(child: _ProgressLine()),
                const SizedBox(width: 44),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'What is your height?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.8,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'This helps us provide accurate, meaningful insights',
              style: TextStyle(fontSize: 13, color: Color(0xFF6E7789)),
            ),
            const SizedBox(height: 18),
            _unitSelector(),
            const SizedBox(height: 18),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: const Color(0xFF202B40),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 180),
                    child: _useMetric ? _metricPicker() : _imperialPickers(),
                  ),
                ],
              ),
            ),
            AppButton(
              text: 'Continue',
              backgroundColor: const Color(0xFFF8F8F7),
              foregroundColor: const Color(0xFF20232A),
              onPressed: () {
                if (_useMetric) {
                  accountProvider.saveHeight('$_selectedCentimeters cm');
                } else {
                  accountProvider.saveHeight(
                    '$_selectedFeet ft $_selectedInches in',
                  );
                }

                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => const ChargingStationScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _unitSelector() {
    return Container(
      width: 120,
      height: 40,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: const Color(0xFF172238),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          _unitOption('Ft/in', !_useMetric, () {
            setState(() => _useMetric = false);
          }),
          _unitOption('Cm', _useMetric, () {
            setState(() => _useMetric = true);
          }),
        ],
      ),
    );
  }

  Widget _unitOption(String label, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFF8F8F7) : Colors.transparent,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? const Color(0xFF22252C)
                  : const Color(0xFF737C8C),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _imperialPickers() {
    return Row(
      key: const ValueKey('imperial'),
      children: [
        Expanded(
          child: _numberPicker(
            values: List.generate(7, (index) => index + 2),
            selectedValue: _selectedFeet,
            unit: 'ft',
            controller: _feetController,
            onChanged: (value) => setState(() => _selectedFeet = value),
          ),
        ),
        Expanded(
          child: _numberPicker(
            values: List.generate(12, (index) => index),
            selectedValue: _selectedInches,
            unit: 'in',
            controller: _inchesController,
            onChanged: (value) => setState(() => _selectedInches = value),
          ),
        ),
      ],
    );
  }

  Widget _metricPicker() {
    final values = List.generate(121, (index) => index + 100);

    return Center(
      key: const ValueKey('metric'),
      child: SizedBox(
        width: 150,
        child: _numberPicker(
          values: values,
          selectedValue: _selectedCentimeters,
          unit: 'cm',
          controller: _centimetersController,
          onChanged: (value) {
            setState(() => _selectedCentimeters = value);
          },
        ),
      ),
    );
  }

  Widget _numberPicker({
    required List<int> values,
    required int selectedValue,
    required String unit,
    required FixedExtentScrollController controller,
    required ValueChanged<int> onChanged,
  }) {
    return CupertinoPicker.builder(
      scrollController: controller,
      itemExtent: 42,
      diameterRatio: 1.4,
      squeeze: 1,
      useMagnifier: false,
      selectionOverlay: const SizedBox.shrink(),
      childCount: values.length,
      onSelectedItemChanged: (index) => onChanged(values[index]),
      itemBuilder: (context, index) {
        final value = values[index];
        final distance = (value - selectedValue).abs();
        final isSelected = distance == 0;
        final opacity = isSelected ? 1.0 : (distance == 1 ? 0.55 : 0.24);

        return Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '$value',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: opacity),
                  fontSize: isSelected ? 28 : 22,
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                ),
              ),
              if (isSelected) ...[
                const SizedBox(width: 10),
                Text(
                  unit,
                  style: const TextStyle(
                    color: Color(0xFF747D8E),
                    fontSize: 11,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _ProgressLine extends StatelessWidget {
  const _ProgressLine();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0x00FFFFFF), Color(0xFFFFFFFF), Color(0xFF35435A)],
          stops: [0, 0.55, 1],
        ),
      ),
    );
  }
}
