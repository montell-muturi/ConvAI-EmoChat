import 'package:emochat/constants.dart';
import 'package:flutter/material.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 140,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 70,
            child: Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Palette.primary),
            ),
          ),
          Positioned(
            top: 30,
            right: 0,
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Palette.primary),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 60,
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Palette.primary),
            ),
          ),
          const Positioned(
            top: 30,
            child: Text(
              'Create Account',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: Palette.primaryDark),
            ),
          ),
        ],
      ),
    );
  }
}

class SigninHeader extends StatelessWidget {
  const SigninHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 140,
      child: Stack(
        children: [
          Positioned(
            top: 35,
            right: 70,
            child: Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Palette.primary),
            ),
          ),
          Positioned(
            top: 0,
            right: 10,
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Palette.primary),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 15,
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Palette.primary),
            ),
          ),
          const Positioned(
            bottom: 50,
            child: Text(
              'Welcome Back!',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: Palette.primaryDark),
            ),
          ),
        ],
      ),
    );
  }
}
