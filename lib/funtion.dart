import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prime/GetModel.dart';
import 'package:prime/url.dart';

List<GetModel> movieList = [];

Future<void> getMOvie() async {
  final movie = await http.get(Uri.parse('$baseUrl?api_key=$apiKey'));
  Map<String, dynamic> result = jsonDecode(movie.body);
  // print(movie.body);
  List<dynamic> data = result['results'];
  for (Map<String, dynamic> i in data) {
    movieList.add(GetModel.fromJson(i));
  }
  // print(movieList);
}
