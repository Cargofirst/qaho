import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:qaho/api/google_sigin_api.dart';
import 'package:qaho/page/home.dart';
import 'package:qaho/utils/random.dart';
import '../bloc/connect/connect_bloc.dart';
import '../model/chat.dart';
import '../bloc/qaho/qaho_bloc.dart';
import '../cubit/chat_cubit.dart';
import '../utils/widgets/skelton.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, this.prompt});
  final String? prompt;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final TextEditingController _controller;
  late final String _sessionId;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _sessionId = RandomString.generate();
    context.read<ConnectBloc>().add(Connect());
  }

  @override
  void dispose() {
    _controller.dispose();
    _scaffoldKey.currentState?.dispose();
    super.dispose();
  }

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
                controller: _controller,
                leading: const Icon(Bootstrap.soundwave),
                onSubmitted: (value) {

                  context.read<QahoBloc>().add(AskQuestion(
                          question: Question(
                        question: value.trim(),
                        sessionId: _sessionId,
                        collectionName: 'questions',
                      )));
                },
                trailing: [
                  Card(
                    color: Colors.black87,
                    shape: const CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BlocConsumer<QahoBloc, QahoState>(
                        listener: (context, state) {
                            context.read<ChatCubit>().addChat(
                              type: Type.human, message: _controller.text);
                          if (state is QahoLoading) {
                            context
                                .read<ChatCubit>()
                                .addChat(type: Type.ai, message: '');

                            _controller.clear();
                          }
                          if (state is QahoFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.error)));
                          } else if (state is QahoSuccess) {
                            context.read<ChatCubit>().updateChat(
                                type: Type.ai, message: state.response.body);


                          }
                        },
                        builder: (context, state) {
                          if (state is QahoLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return Icon(
                            Icons.send,
                            color: Colors.grey[200],
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                'Qaho can make mistake,verify the important information.',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),

        child: BlocBuilder<ChatCubit, List<Chat>>(
          builder: (context, state) {
            return ListView.builder(
              shrinkWrap: true,
              reverse: true,
              itemBuilder: (context, index) {
                final chat = state[index];
                if (chat.type == Type.ai) {
                  return AnswerCard(text: chat.message);
                } else {
                  return QuestionCard(answer: chat.message);
                }
              },
              itemCount: state.length,
            );
          },
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
          if (text.isEmpty)
            SizedBox(
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Skelton(
                    height: 16,
                    width: 250,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Skelton(
                        height: 16,
                        width: 150,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Skelton(
                        height: 16,
                        width: 100,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Skelton(
                    height: 16,
                    width: 250,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Skelton(
                    height: 16,
                    width: 200,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  const Skelton(
                    height: 16,
                    width: 250,
                  ),
                ],
              ),
            ),
          if (text.isNotEmpty)
            Expanded(
              child: Markdown(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                data: text,
                styleSheetTheme: MarkdownStyleSheetBaseTheme.material,
              ),
            )
        ],
      ),
    );
  }
}
