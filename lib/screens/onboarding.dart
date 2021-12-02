import 'package:emochat/constants.dart';
import 'package:emochat/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.page!.round() != _currentPage) {
        setState(() {
          _currentPage = controller.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScrollConfiguration(
          behavior: NoScrollGlow(),
          child: PageView(
            controller: controller,
            children: const [
              ScreenA(),
              ScreenB(),
              ScreenC(),
            ],
          ),
        ),
        FutureBuilder(
          future: Future.value(true),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            return Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 16, 16),
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()));
                        },
                        child: const Text(
                          'SKIP',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )),
                    const Spacer(),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: _currentPage == 0 ? 20 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Palette.primaryDark),
                        ),
                        const SizedBox(width: 4),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: _currentPage == 1 ? 20 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Palette.primaryDark),
                        ),
                        const SizedBox(width: 4),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: _currentPage == 2 ? 20 : 8,
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
                      child: _currentPage == 2
                          ? IconButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen())),
                              icon: const Icon(Icons.check))
                          : IconButton(
                              onPressed: () {
                                controller.nextPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.ease);
                                _currentPage += 1;
                              },
                              icon: const Icon(Icons.chevron_right)),
                    )
                  ],
                ),
              ),
            );
          },
        )
      ],
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

class NoScrollGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
