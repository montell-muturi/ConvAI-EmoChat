import 'package:emochat/constants.dart';
import 'package:emochat/screens/chat.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late UserCredential _userCredential;

  String _email = "";
  String _password = "";
  String _firebaseError = "";

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
                  return 'Please enter your email address.';
                }
                if (_firebaseError == 'email-already-in-use') {
                  _firebaseError = '';
                  return 'The email address is already in use by another account.';
                }
                if (_firebaseError == 'invalid-email') {
                  _firebaseError = '';
                  return 'The email address is badly formatted.';
                }
                setState(() {
                  _email = value.trim();
                });
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
                // if (value.length < 8) {
                //   return 'Your password is too short.';
                // }
                if (_firebaseError == 'weak-password') {
                  _firebaseError = '';
                  return 'Password should be at least 6 characters.';
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
                setState(() {
                  _password = value.trim();
                });
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
                    onPressed: () async {
                      if (_signupFormKey.currentState!.validate()) {
                        try {
                          _userCredential =
                              await _auth.createUserWithEmailAndPassword(
                                  email: _email, password: _password);
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  'Account created successfully.')));
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ChatScreen()));
                        } on FirebaseAuthException catch (e) {
                          setState(() {
                            _firebaseError = e.code;
                            _signupFormKey.currentState!.validate();
                          });
                        }
                      }
                    },
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(color: Colors.black),
                    )))
          ],
        ));
  }
}

class SigninForm extends StatefulWidget {
  const SigninForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late UserCredential _userCredential;

  String _email = "";
  String _password = "";
  String _firebaseError = "";
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
                if (_firebaseError == 'user-not-found') {
                  _firebaseError = '';
                  return 'There is no user with this email.';
                }
                if (_firebaseError == 'invalid-email') {
                  _firebaseError = '';
                  return 'The email address is badly formatted.';
                }
                setState(() {
                  _email = value.trim();
                });
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
                if (value.length < 6) {
                  return 'Your password is too short.';
                }
                if (_firebaseError == 'wrong-password') {
                  _firebaseError = '';
                  return 'The password is incorrect.';
                }
                setState(() {
                  _password = value.trim();
                });
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
                    onPressed: () async {
                      if (_loginFormKey.currentState!.validate()) {
                        try {
                          _userCredential =
                              await _auth.signInWithEmailAndPassword(
                                  email: _email,
                                  password: _password);
                                  ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Logging in.')));
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ChatScreen()));
                        } on FirebaseAuthException catch (e) {
                          setState(() {
                            _firebaseError = e.code;
                            _loginFormKey.currentState!.validate();
                          });
                        }

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
