import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaho/routes/app_page.dart';
import 'package:qaho/utils/theme/theme_data.dart';

import 'bloc/qaho_bloc.dart';
import 'cubit/chat_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatCubit>(
          create: (context) => ChatCubit(),
        ),
        BlocProvider(create: (context) => QahoBloc())
      ],
      child: MaterialApp.router(
        title: 'Qaho',
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.themeData,
        routerConfig: AppPage().goRouter,
      ),
    );
  }
}
