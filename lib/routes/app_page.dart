import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qaho/page/chat.dart';
import 'package:qaho/page/home.dart';
import 'package:qaho/page/subscription.dart';
import 'package:qaho/routes/app_routes.dart';

import '../page/history.dart';
import '../page/profile.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppPage {
  final GoRouter _goRouter = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScafoldWithNav(body: navigationShell);
          },
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) {
                  return const HomePage();
                },
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: AppRoutes.chatD,
                builder: (context, state) {
                  return const Center();
                },
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: AppRoutes.voice,
                builder: (context, state) {
                  return const Center(
                    child: Text('Coming Soon'),
                  );
                },
              ),
            ]),
          ]),
      GoRoute(
        path: AppRoutes.chat,
        builder: (context, state) {
          return const ChatPage();
        },
      ),
      GoRoute(
        path: AppRoutes.history,
        builder: (context, state) {
          return const HistortyPage();
        },
      ),
      GoRoute(
          path: AppRoutes.setting,
          builder: (context, state) {
            return const SettingPage();
          },
          routes: [
            // GoRoute(path: AppRoutes.policy, builder: (context, state) => ,)
            GoRoute(
              path: AppRoutes.subscription.split('/')[2],
              builder: (context, state) {
                return const Subscription();
              },
            )
          ]),
    ],
  );
  get goRouter => _goRouter;
}
