import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news/injection_container.dart';

import 'config/theme/app_theme.dart';

Future<void> main() async {
  intializeDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        home: const DailyNews(),
      ),
    );
  }
}
