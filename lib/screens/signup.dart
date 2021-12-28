import 'package:emochat/components/forms.dart';
import 'package:emochat/components/headers.dart';
import 'package:emochat/components/third_party.dart';
import 'package:emochat/constants.dart';
import 'package:emochat/screens/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.secondary,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: double.infinity),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  const SignupHeader(),
                  const SignupForm(),
                  const Spacer(),
                  const Text('or create with'),
                  const SizedBox(height: 32),
                  const ThirdPartyAuth(),
                  const Spacer(),
                  RichText(
                      text: TextSpan(
                          text: 'Already have an account? ',
                          style: const TextStyle(color: Colors.black),
                          children: <TextSpan>[
                        TextSpan(
                            text: 'Log In',
                            style: const TextStyle(
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen())))
                      ])),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
