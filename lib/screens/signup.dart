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
    final _signupFormKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Palette.secondary,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          child: Column(
            children: [
              const Header(),
              Form(
                  key: _signupFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide.none),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 18),
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black38)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address :)';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide.none),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 18),
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black38)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide.none),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 18),
                            hintText: 'Confirm password',
                            hintStyle: const TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black38)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password again.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Palette.primary,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)),
                                  elevation: 0),
                              onPressed: () {
                                if (_signupFormKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                }
                              },
                              child: const Text(
                                'SIGN UP',
                                style: TextStyle(color: Colors.black),
                              )))
                    ],
                  )),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('or create with'),
              ),
              Row(
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
              ),
              const Spacer(),
              RichText(
                text: TextSpan(
                    text: 'Already have an account?',
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
                                    builder: (context) => const LoginScreen())))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatefulWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [
          AnimatedPositioned(
              top: 0,
              left: 70,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Palette.primary),
              ),
              duration: const Duration(milliseconds: 200)),
          AnimatedPositioned(
              top: 90,
              left: 160,
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Palette.primary),
              ),
              duration: const Duration(milliseconds: 200)),
          AnimatedPositioned(
              top: 140,
              left: 90,
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Palette.primary),
              ),
              duration: const Duration(milliseconds: 200)),
          const AnimatedPositioned(
              top: 30,
              child: Text(
                'Create Account',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: Palette.primaryDark),
              ),
              duration: Duration(milliseconds: 200)),
        ],
      ),
    );
  }
}
