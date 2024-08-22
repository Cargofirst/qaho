import 'package:flutter/material.dart';
import 'package:qaho/page/home.dart';

import '../../page/chat.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const QahoIcon(
                size: 36,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                'Qaho',
                style: Theme.of(context).textTheme.headlineLarge,
              )
            ],
          )),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Features',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          const ListTile(
            title: Text('Weather Data'),
          ),
          const ListTile(
            title: Text('Harvest Map'),
          ),
          const ListTile(
            title: Text('Export Import Data'),
          ),
          const Spacer(),
          const ListTile(
            leading: ProfileIcon(),
            title: Text('Pradeep'),
            // trailing: Icon(Icons.dashboard),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
