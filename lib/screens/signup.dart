import 'package:emochat/constants.dart';
import 'package:emochat/screens/chat.dart';
import 'package:emochat/screens/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? _password;
  final _signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.secondary,
      body: ScrollConfiguration(
        behavior: NoScrollGlow(),
        child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - kToolbarHeight,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 28),
                child: Column(
                  children: [
                    const Header(),
                    const Spacer(),
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
                            const SizedBox(height: 16),
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
                                RegExp regExp = RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])');
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a password.';
                                }
                                if (regExp.hasMatch(value)) {
                                  return 'Please enter a stronger password.';
                                }
                                if (value.length < 8) {
                                  return 'Your password is too short!';
                                }
                                _password = value;
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
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
                                if (value != _password) {
                                  return 'Passwords do not match!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Palette.primary,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 20),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        elevation: 0),
                                    onPressed: () {
                                      if (_signupFormKey.currentState!
                                          .validate()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content:
                                                  Text('Creating account...')),
                                        );
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ChatScreen()));
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
                    const SizedBox(
                      height: 16,
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
                                          builder: (context) =>
                                              const LoginScreen())))
                          ]),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}

class NoScrollGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

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
