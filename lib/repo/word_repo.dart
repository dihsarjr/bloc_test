import 'package:bloc_testing/model/dictionary_model.dart';
import 'package:bloc_testing/services/http_service.dart';
import 'package:http/http.dart';

class WordRepo {
  Future<List<DictionaryModel>> getWordData({required String word}) async {
    late final Response response;
    late final List<DictionaryModel> dictionaryModel;

    try {
      response = await HttpService.getRequest(word: word);
      if (response.statusCode == 200) {
        print(response.body);
        dictionaryModel = dictionaryModelFromJson(response.body);
      } else {
        print("${response.statusCode} Error fuck");
      }
    } catch (e) {
      rethrow;
    }
    return dictionaryModel;
  }
}
