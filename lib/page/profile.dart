import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qaho/page/home.dart';
import 'package:qaho/routes/app_routes.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Setting"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Card(
                color: Colors.black12,
                shape: CircleBorder(),
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: ProfileImage(
                    radius: 20,
                    size: 26,
                  ),
                ),
              ),
              title: Text(
                'Pradeep',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            const Text('Account'),
            const ListTile(
              leading: Icon(
                Icons.email,
                size: 36,
              ),
              title: Text('Email'),
              subtitle: Text('tech@cargofirst.net'),
            ),
            ListTile(
              leading: Icon(
                Icons.safety_check,
                size: 36,
              ),
              onTap: () {
                context.push(AppRoutes.subscription);
              },
              title: Text('Subscription'),
              subtitle: Text('Free plan'),
            ),
            const Text('App'),
            const ListTile(
              leading: Icon(
                Icons.wb_sunny_outlined,
                size: 36,
              ),
              title: Text('Theme'),
              subtitle: Text('Light'),
            ),
            const ListTile(
              leading: Icon(
                Icons.language,
                size: 36,
              ),
              title: Text('Language'),
              subtitle: Text('English'),
            ),
            const Text('About'),
            const ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
            ),
            const ListTile(
              leading: Icon(Icons.book_online),
              title: Text('Term and condition'),
            ),
            const ListTile(
              leading: QahoIcon(),
              title: Text('Qaho 1.1.0'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red[50]),
                  foregroundColor: const WidgetStatePropertyAll(Colors.red)),
              child: const Text('Sign Out'),
            )
          ],
        ),
      ),
    );
  }
}
