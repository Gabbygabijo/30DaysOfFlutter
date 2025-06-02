import 'dart:convert';

import 'package:aflutterapp/pokemon_page_response.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    // pokemon?limit=200&offset=0

    final queryParameters = {
      'limit': '200',
      'offset': (pageIndex * 200).toString()
    };

    final url = Uri.https(baseUrl, '/api/v2/pokemon', queryParameters);

    final response = await client.get(url);
    final json = jsonDecode(response.body);

    return PokemonPageResponse.fromJson(json);
  }
}