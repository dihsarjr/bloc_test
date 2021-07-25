// To parse this JSON data, do
//
//     final dictionaryModel = dictionaryModelFromJson(jsonString);

import 'dart:convert';

List<DictionaryModel> dictionaryModelFromJson(String str) =>
    List<DictionaryModel>.from(
        json.decode(str).map((x) => DictionaryModel.fromJson(x)));

String dictionaryModelToJson(List<DictionaryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DictionaryModel {
  DictionaryModel({
    required this.word,
    required this.phonetics,
    required this.meanings,
  });

  final String word;
  final List<Phonetic> phonetics;
  final List<Meaning> meanings;

  factory DictionaryModel.fromJson(Map<String, dynamic> json) =>
      DictionaryModel(
        word: json["word"],
        phonetics: List<Phonetic>.from(
            json["phonetics"].map((x) => Phonetic.fromJson(x))),
        meanings: List<Meaning>.from(
            json["meanings"].map((x) => Meaning.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "phonetics": List<dynamic>.from(phonetics.map((x) => x.toJson())),
        "meanings": List<dynamic>.from(meanings.map((x) => x.toJson())),
      };
}

class Meaning {
  Meaning({
    required this.partOfSpeech,
    required this.definitions,
  });

  final String partOfSpeech;
  final List<Definition> definitions;

  factory Meaning.fromJson(Map<String, dynamic> json) => Meaning(
        partOfSpeech: json["partOfSpeech"],
        definitions: List<Definition>.from(
            json["definitions"].map((x) => Definition.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "partOfSpeech": partOfSpeech,
        "definitions": List<dynamic>.from(definitions.map((x) => x.toJson())),
      };
}

class Definition {
  Definition({
    required this.definition,
    this.example,
    required this.synonyms,
  });

  final String definition;
  final String? example;
  final List<String>? synonyms;

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
        definition: json["definition"],
        example: json["example"] ?? "",
        synonyms: json["synonyms"] == null
            ? null
            : List<String>.from(json["synonyms"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "definition": definition,
        "example": example,
        "synonyms": synonyms == null
            ? null
            : List<dynamic>.from(synonyms!.map((x) => x)),
      };
}

class Phonetic {
  Phonetic({
    required this.text,
    required this.audio,
  });

  final String text;
  final String audio;

  factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
        text: json["text"],
        audio: json["audio"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "audio": audio,
      };
}
