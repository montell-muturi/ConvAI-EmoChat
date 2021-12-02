import 'package:emochat/constants.dart';
import 'package:emochat/screens/chat.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    Key? key,
    required GlobalKey<FormState> signupFormKey,
    required TextEditingController passwordController,
  })  : _signupFormKey = signupFormKey,
        _passwordController = passwordController,
        super(key: key);

  final GlobalKey<FormState> _signupFormKey;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
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
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  hintText: 'Email',
                  hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.black38)),
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
              controller: _passwordController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.black38)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password.';
                }
                if (value.length < 8) {
                  return 'Your password is too short!';
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
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  hintText: 'Confirm password',
                  hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.black38)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password again.';
                }
                if (value != _passwordController.text) {
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
                            borderRadius: BorderRadius.circular(100)),
                        elevation: 0),
                    onPressed: () {
                      if (_signupFormKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Creating account...')),
                        );
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ChatScreen()));
                      }
                    } /*}*/,
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(color: Colors.black),
                    )))
          ],
        ));
  }
}

class SigninForm extends StatelessWidget {
  const SigninForm({
    Key? key,
    required GlobalKey<FormState> loginFormKey,
  })  : _loginFormKey = loginFormKey,
        super(key: key);

  final GlobalKey<FormState> _loginFormKey;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  hintText: 'Email',
                  hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.black38)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email address.';
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
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.black38)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password.';
                }
                if (value.length < 8) {
                  return 'Your password is too short!';
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
                            borderRadius: BorderRadius.circular(100)),
                        elevation: 0),
                    onPressed: () {
                      if (_loginFormKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Logging in...')),
                        );
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ChatScreen()));
                      }
                    },
                    child: const Text(
                      'LOG IN',
                      style: TextStyle(color: Colors.black),
                    )))
          ],
        ));
  }
}
