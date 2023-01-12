import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BackendService {
  static Future<List<Map<String, String>>> getSuggestions(String query) async {
    if (query.isEmpty && query.length < 3) {
      print('Query needs to be at least 3 chars');
      return Future.value([]);
    }

    String url =
        'http://196.202.30.109/AspNetWebApiRest/api/ListItems/getdata';
    Map data = {
      'featureClass': "p",
      'style': "full",
      'maxRows': "5",
      'name_startsWith': query
    };

    String body = json.encode(data);
    var response = await http.post(Uri.parse(url), body:body,  headers: {"Content-Type": "application/json"}, );


    /*
    var url = Uri.https('api.datamuse.com', '/sug', {'s': query});

    var response = await http.get(url);
    */


    List<Suggestion> suggestions = [];
    if (response.statusCode == 200) {
      Iterable json = convert.jsonDecode(response.body);
      suggestions =
      List<Suggestion>.from(json.map((model) => Suggestion.fromJson(model)));

      print('Number of suggestion: ${suggestions.length}.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return Future.value(suggestions
        .map((e) => {'brandMain': e.brandMain.toString(), 'brandSub': e.brandSub.toString(), 'fullBrandName': e.fullBrandName.toString(), 'countryOfOrigin': e.countryOfOrigin.toString()})
        .toList());
  }
}

class Suggestion {
  final int? brandMain;
  final int? brandSub;

  final String? fullBrandName;
  final String? countryOfOrigin;

  Suggestion({
    required this.brandMain,
    required this.brandSub,
    required this.fullBrandName,
    required this.countryOfOrigin,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
      brandMain: json['brandMain'],
      brandSub: json['brandSub'],
      fullBrandName: json['fullBrandName'],
      countryOfOrigin: json['countryOfOrigin'],
    );
  }
}