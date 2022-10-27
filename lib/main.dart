import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/feature/presentation/list_news_everything/controller/list_news_everythings_cubit.dart';
import 'package:news_app/route_generator.dart';

import 'feature/presentation/list_news_top_headlines/controller/list_news_top_headlines_cubit.dart';
import 'injection.container.dart' as di;
import 'injection.container.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox<dynamic>('SavedNews');
  await di.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TabTopHeadlinesCubit>(
          create: (context) => sl<TabTopHeadlinesCubit>(),
        ),
        BlocProvider<TabEverythingsCubit>(
          create: (context) => sl<TabEverythingsCubit>(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    ),
  );
}
