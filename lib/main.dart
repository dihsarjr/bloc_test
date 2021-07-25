import 'package:bloc_testing/bloc/dictionary_cubit.dart';
import 'package:bloc_testing/repo/word_repo.dart';
import 'package:bloc_testing/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (_) => DictionaryCubit(
            repo: WordRepo(),
          ),
          lazy: false,
        ),
      ], child: Home()),
    );
  }
}
