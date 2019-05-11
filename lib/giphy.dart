import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Giphy {
  final String id;
  final String title;
  final String rating;
  final String imageUrl;
  Giphy({this.id, this.title, this.rating, this.imageUrl});
  factory Giphy.fromJson(Map<String, dynamic> json)  {
    return Giphy(
        id: json['id'] as String,
        title: json['title'] as String,
        rating: json['rating'] as String,
        imageUrl: json['images']['fixed_height']['url'] as String
    );
  }

  static Stream<List<Giphy>> searchStream(String term) {
    return Stream<List<Giphy>>.fromFuture(search(term));
  }

  static Future<List<Giphy>> search(String term) async {
    print(term);
    if (term.isEmpty) {
      return List<Giphy>();
    }
    final apiURL = "https://api.giphy.com/v1/gifs/search?api_key=dc6zaTOxFJmzC&q=" + term + "";
    final repsonse = await http.Client().get(apiURL);
    final body = json.decode(repsonse.body);
    final data = body["data"];
    final giphies = data.map<Giphy>((json) => Giphy.fromJson(json)).toList();
    return giphies;
  }
}