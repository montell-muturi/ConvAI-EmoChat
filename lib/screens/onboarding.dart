import 'package:emochat/constants.dart';
import 'package:emochat/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> screenList = <Widget>[
      const ScreenA(),
      const ScreenB(),
      const ScreenC(),
    ];
    PageController controller = PageController();

    return SafeArea(
      child: Stack(
        children: [
          PageView.builder(
              itemCount: screenList.length,
              controller: controller,
              itemBuilder: (context, index) {
                return screenList[index];
              }),
          const ActionBar()
        ],
      ),
    );
  }
}

class ScreenA extends StatelessWidget {
  const ScreenA({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.secondary,
      padding: const EdgeInsets.fromLTRB(28, 48, 28, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'EmoChat',
            style: TextStyle(
                fontFamily: 'CabinetGrotesk',
                fontSize: 48,
                letterSpacing: 3,
                color: Color(0xFF333318)),
          ),
          const Text(
            'Hello there!',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 64),
          SvgPicture.asset('assets/images/screen-1.svg'),
          const SizedBox(height: 48),
          const Align(
              alignment: Alignment.center,
              child: Text('I\'m really excited to be your friend!'))
        ],
      ),
    );
  }
}

class ScreenB extends StatelessWidget {
  const ScreenB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.secondary,
      padding: const EdgeInsets.fromLTRB(28, 48, 28, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EmoChat',
            style: TextStyle(
              fontFamily: 'CabinetGrotesk',
              fontSize: 48,
              letterSpacing: 3,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1
                ..color = Palette.primaryDark,
            ),
          ),
          const SizedBox(height: 36),
          SvgPicture.asset('assets/images/screen-2.svg'),
          const SizedBox(height: 48),
          const Align(
              alignment: Alignment.center,
              child: Text('We can learn so much about each other...'))
        ],
      ),
    );
  }
}

class ScreenC extends StatelessWidget {
  const ScreenC({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.secondary,
      padding: const EdgeInsets.fromLTRB(28, 48, 28, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EmoChat',
            style: TextStyle(
              fontFamily: 'CabinetGrotesk',
              fontSize: 48,
              letterSpacing: 3,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1
                ..color = Palette.primaryDark,
            ),
          ),
          const SizedBox(height: 54),
          SvgPicture.asset('assets/images/screen-3.svg'),
          const SizedBox(height: 84),
          const Align(
              alignment: Alignment.centerRight,
              child: Text('...And learn to navigate our thoughts together.')),
          const SizedBox(height: 24),
          const Align(
              alignment: Alignment.center,
              child: Text(
                'Lets Talk Already!',
                style: TextStyle(fontSize: 18),
              ))
        ],
      ),
    );
  }
}

class ActionBar extends StatefulWidget {
  const ActionBar({Key? key}) : super(key: key);

  @override
  State<ActionBar> createState() => _ActionBarState();
}

class _ActionBarState extends State<ActionBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(28, 0, 16, 16),
        child: Row(
          children: [
            const Text(
              'SKIP',
              style: TextStyle(fontSize: 18),
            ),
            const Spacer(),
            Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 20,
                  height: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Palette.primaryDark),
                ),
                const SizedBox(width: 4),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Palette.primaryDark),
                ),
                const SizedBox(width: 4),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Palette.primaryDark),
                )
              ],
            ),
            const Spacer(),
            Container(
              decoration: const BoxDecoration(
                  color: Palette.primary, shape: BoxShape.circle),
              child: InkWell(
                splashColor: Palette.secondary,
                child: IconButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen())),
                    icon: const Icon(Icons.chevron_right)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
