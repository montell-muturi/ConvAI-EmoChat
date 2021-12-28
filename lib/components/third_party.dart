import 'package:emochat/screens/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ThirdPartyAuth extends StatelessWidget {
  const ThirdPartyAuth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        GestureDetector(
          onTap: () async {
            final GoogleSignInAccount? googleUser =
                await GoogleSignIn().signIn();

            final GoogleSignInAuthentication? googleAuth =
                await googleUser?.authentication;

            final credential = GoogleAuthProvider.credential(
                accessToken: googleAuth?.accessToken,
                idToken: googleAuth?.idToken);

            try {
              await FirebaseAuth.instance.signInWithCredential(credential);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Google account linked.')));
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ChatScreen()));
            } on FirebaseAuthException catch (e) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(e.message.toString())));
            }
          },
          child: ClipOval(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(6),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/google_icon.png',
                  width: 44,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () async {
            final LoginResult loginResult = await FacebookAuth.instance.login();

            final OAuthCredential facebookAuthCredential =
                FacebookAuthProvider.credential(loginResult.accessToken!.token);

            try {
              await FirebaseAuth.instance
                  .signInWithCredential(facebookAuthCredential);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Facebook account linked.')));
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ChatScreen()));
            } on FirebaseAuthException catch (e) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(e.message.toString())));
            }
          },
          child: ClipOval(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(6),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/fb_icon.png',
                  width: 44,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
