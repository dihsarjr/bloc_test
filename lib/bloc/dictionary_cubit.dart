import 'package:bloc_testing/model/dictionary_model.dart';
import 'package:bloc_testing/repo/word_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final WordRepo repo;
  DictionaryCubit({required this.repo}) : super(NoWordSearchedState());
  final TextEditingController wordText = TextEditingController();

  Future getWordDictionary() async {
    emit(WordSearchingSate());
    try {
      final List<DictionaryModel>? list =
          await repo.getWordData(word: wordText.text);

      if (list == null) {
        print("Error");
        emit(ErrorWordSearchingSate("No List Available"));
      } else {
        print("data");
        emit(WordSearchedSate(word: list));
      }
    } catch (e) {
      print("Error");
      emit(ErrorWordSearchingSate(e.toString()));
      rethrow;
    }
  }
}

abstract class DictionaryState {}

class NoWordSearchedState extends DictionaryState {}

class WordSearchingSate extends DictionaryState {}

class WordSearchedSate extends DictionaryState {
  final List<DictionaryModel> word;
  WordSearchedSate({required this.word});
}

class ErrorWordSearchingSate extends DictionaryState {
  final String error;
  ErrorWordSearchingSate(
    this.error,
  );
}
