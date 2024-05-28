import 'package:consume_api/data/remote_service.dart';
import 'package:consume_api/presentation/bloc/post_bloc.dart';
import 'package:consume_api/presentation/dependency_injection.dart/init_injection.dart';
import 'package:consume_api/presentation/views/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  DependencyInjection.setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rest Api with Bloc',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PostScreen(),
      ),
    );
  }
}
