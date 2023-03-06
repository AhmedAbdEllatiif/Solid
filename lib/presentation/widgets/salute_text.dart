import 'package:flutter/material.dart';

class SaluteTextWidget extends StatelessWidget {
  final Color textColor;

  const SaluteTextWidget({Key? key, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hey there",
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: textColor,
          ),
    );
  }
}
