import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:icons_plus/icons_plus.dart';
import 'package:qaho/api/google_sigin_api.dart';
import 'package:qaho/page/home.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({super.key, this.prompt});
  final String? prompt;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leadingWidth: 60,
        toolbarHeight: 60,
        actions: [
          const ProfileIcon(),
          const SizedBox(
            width: 16,
          ),
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 25,
            child: const Badge(
              backgroundColor: Colors.green,
              child: Icon(Icons.notifications),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
        ],
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: const RotatedBox(
              quarterTurns: 1,
              child: Icon(
                FontAwesome.chart_simple_solid,
                size: 30,
              ),
            ),
          );
        }),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: 'search',
              child: SearchBar(
                hintText: 'Ask Question',
                leading: const Icon(Bootstrap.soundwave),
                trailing: [
                  Card(
                    color: Colors.black87,
                    shape: const CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.send,
                        color: Colors.grey[200],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                'Qaho can make mistake ,please forgive me',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Colors.black45),
              ),
            )
          ],
        ),
      ),
      drawer: const Drawer(),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            QuestionCard(answer: 'What are the problems '),
            AnswerCard(
              text:
                  'What are the problems faced by Exporters in India,What are the problems faced by Exporters in IndiaWhat are the problems faced by Exporters in India',
            ),
            QuestionCard(
                answer:
                    'What are the problems What are the problems faced by Exporters in India,What are the problems faced by Exporters in IndiaWhat are the problems faced by Exporters in India'),
            AnswerCard(
              text: 'What are the problems faced by ',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await GoogleSiginApi.signIn();
      },
      child: Ink(
        child: const CircleAvatar(
          backgroundColor: Colors.grey,
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, required this.answer});
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8).copyWith(left: 26),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Text(
          answer,
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}

class AnswerCard extends StatelessWidget {
  const AnswerCard({super.key, this.widget, required this.text});
  final Widget? widget;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const QahoIcon(),
          const SizedBox(
            width: 24,
          ),
          Expanded(child: Text(text))
        ],
      ),
    );
  }
}
