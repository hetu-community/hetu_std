import 'dart:convert';

class JSON {
  static String encode(Object? object) {
    return jsonEncode(object);
  }

  static Object? decode(String jsonString) {
    return jsonDecode(jsonString);
  }
}