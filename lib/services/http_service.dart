import 'package:http/http.dart';

class HttpService {
  static final String baseUrl =
      "https://api.dictionaryapi.dev/api/v2/entries/en_US/";

  static Future<Response> getRequest({required String word}) async {
    late final Response response;
    final Uri url = Uri.parse("$baseUrl$word");
    try {
      response = await get(url);
    } catch (e) {
      rethrow;
    }
    return response;
  }
}
