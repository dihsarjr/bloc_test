import 'package:bloc_testing/bloc/dictionary_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DictionaryCubit dictionaryCubit = context.watch<DictionaryCubit>();
    return BlocBuilder<DictionaryCubit, DictionaryState>(
        bloc: dictionaryCubit,
        builder: (context, state) {
          return Scaffold(
            body: dictionaryCubit.state is NoWordSearchedState
                ? Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: ListView(
                      children: [
                        TextFormField(
                          controller: dictionaryCubit.wordText,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              dictionaryCubit.getWordDictionary();
                            },
                            child: Text("New Text"))
                      ],
                    ),
                  )
                : dictionaryCubit.state is WordSearchingSate
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : dictionaryCubit.state is WordSearchedSate
                        ? Center(
                            child: Text(state is WordSearchedSate
                                ? state.word.toString()
                                : "No"))
                        : dictionaryCubit.state is ErrorWordSearchingSate
                            ? Center(
                                child: Text("ErrorWordSearchingSate.error"))
                            : Container(),
          );
        });
  }
}
