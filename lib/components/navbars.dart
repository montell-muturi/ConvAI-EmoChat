import 'package:emochat/constants.dart';
import 'package:emochat/screens/settings.dart';
import 'package:emochat/screens/statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatNav extends StatelessWidget {
  const ChatNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 0))
      ]),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          IconButton(
              tooltip: 'Settings',
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsScreen())),
              icon: const Icon(
                Icons.settings,
                color: Palette.primaryDark,
              )),
          const Spacer(),
          Tooltip(
            message: 'Your data',
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const StatisticsScreen())),
              child: SizedBox(
                width: 64,
                height: double.infinity,
                child: SvgPicture.asset('assets/images/typing_ind.svg'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class StatisticsNav extends StatelessWidget {
  const StatisticsNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 0))
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                tooltip: 'Back to chat',
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.close,
                  color: Palette.primaryDark,
                )),
          ),
          const Center(
              child: Text(
            'What I\'ve Learnt',
            style: TextStyle(
              fontSize: 18,
            ),
          ))
        ],
      ),
    );
  }
}
