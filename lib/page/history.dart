import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:qaho/page/chat.dart';
import 'package:qaho/page/home.dart';

class HistortyPage extends StatefulWidget {
  const HistortyPage({super.key});

  @override
  State<HistortyPage> createState() => _HistortyPageState();
}

class _HistortyPageState extends State<HistortyPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Card(
          shape: CircleBorder(),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.add,
              color: Colors.black,
              size: 36,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        icon: const Text('New Chart'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const RecentChatBox();
              },
              itemCount: 3,
            ),
            Text(
              'Previous 30 day',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const RecentChatBox();
              },
              itemCount: 3,
            ),
            Text(
              'jun',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const RecentChatBox();
              },
              itemCount: 3,
            ),
            Text(
              'jully',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const RecentChatBox();
              },
              itemCount: 3,
            ),
          ],
        ),
      ),
    );
  }
}
