import 'package:flutter/material.dart';
import 'package:random_number/component/number_row.dart';
import 'package:random_number/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  int maxNumber;
  int num = 0;
 
  SettingsScreen({required this.maxNumber, super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 1000;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    maxNumber = widget.maxNumber.toDouble(); // state가 실행이 될때 가장 먼저 실행된다.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Body(maxNumber: maxNumber),
              _Footer(
                maxNumber: maxNumber,
                onSlideChaged: onSlideNumber,
                onPressed: onElevatedButton,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSlideNumber(double value) {
    setState(() {
      maxNumber = value;
    });
  }

  void onElevatedButton() {
    Navigator.of(context).pop(maxNumber.toInt());
  }
}

class _Footer extends StatelessWidget {
  final ValueChanged<double>? onSlideChaged;
  final VoidCallback onPressed;

  const _Footer({
    Key? key,
    required this.maxNumber,
    required this.onSlideChaged,
    required this.onPressed,
  }) : super(key: key);

  final double maxNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
          value: maxNumber,
          min: 1000,
          max: 100000,
          onChanged: onSlideChaged,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: RED_COLOR),
          onPressed: onPressed,
          child: const Text('저장'),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.maxNumber,
  }) : super(key: key);

  final double maxNumber;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(
        number: maxNumber.toInt(),
      ),
    );
  }
}
