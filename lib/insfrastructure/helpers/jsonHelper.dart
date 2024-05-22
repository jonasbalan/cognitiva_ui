import 'dart:convert';

class JsonDynamicSerializer {
  static String jsonDynamicEncode(Map<String, dynamic> data) {
    // data.entries.map((e) => {
    //   if(e.value is DateTime)
    //   {
    //      return
    //   }
    // });

    return jsonEncode(data);
  }
}
