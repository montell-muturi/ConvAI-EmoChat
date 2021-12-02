import 'dart:ui';

import 'package:emochat/components/navbars.dart';
import 'package:emochat/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final inputController = TextEditingController();

  final messages = List<String>.generate(1000, (i) => "Message $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ClipRRect(
          child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                      child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.separated(
                        reverse: true,
                        shrinkWrap: true,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return Align(
                            alignment: index % 2 == 0
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width /
                                      4 *
                                      3),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: index % 2 == 0
                                      ? Palette.primary
                                      : Palette.secondary),
                              child: Text(messages[index]),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 8,
                          );
                        },
                      ),
                    ),
                    const ChatNav(),
                  ])),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                            controller: inputController,
                            maxLines: 5,
                            minLines: 1,
                            keyboardType: TextInputType.multiline,
                            style: const TextStyle(height: 1.7),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Palette.secondary,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                hintText: 'Type your message here...',
                                hintStyle: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black26)),
                          )),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Palette.primary, shape: BoxShape.circle),
                            child: IconButton(
                                onPressed: () {
                                  if (inputController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            duration:
                                                Duration(milliseconds: 800),
                                            content:
                                                Text('Message is empty!')));
                                  } else {
                                    messages.insert(0, inputController.text);
                                    inputController.clear();
                                    setState(() {});
                                  }
                                },
                                icon: const Icon(Icons.chevron_right)),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
