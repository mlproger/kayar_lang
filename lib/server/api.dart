import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> getLink(String href) async{
  String url = "https://cloud-api.yandex.net/v1/disk/public/resources/download?public_key=";
  var publik_key = Uri.encodeComponent(href);
  var newURL = Uri.parse(url + publik_key);
  var response = await http.get(newURL);
  return jsonDecode(response.body)["href"];
}