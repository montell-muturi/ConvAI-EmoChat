import 'package:flutter/material.dart';

class ThirdPartyAuth extends StatelessWidget {
  const ThirdPartyAuth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // todo: add google and facebook signin here
      children: const [
        Spacer(),
        Placeholder(
          fallbackHeight: 48,
          fallbackWidth: 48,
        ),
        Spacer(),
        Placeholder(
          fallbackHeight: 48,
          fallbackWidth: 48,
        ),
        Spacer(),
      ],
    );
  }
}
