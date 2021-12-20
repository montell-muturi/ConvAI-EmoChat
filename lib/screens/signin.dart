import 'package:emochat/components/forms.dart';
import 'package:emochat/components/headers.dart';
import 'package:emochat/components/third_party.dart';
import 'package:emochat/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.secondary,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: double.infinity,
              maxHeight: MediaQuery.of(context).size.height),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  const SigninHeader(),
                  const SigninForm(),
                  const Spacer(),
                  const Text('or log in with'),
                  const SizedBox(height: 32),
                  const ThirdPartyAuth(),
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: const TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Sign Up',
                              style: const TextStyle(
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pop(context))
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
