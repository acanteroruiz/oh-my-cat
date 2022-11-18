import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oh_my_cat/features/random_cat/domain/models/random_cat.dart';
import 'package:oh_my_cat/features/random_cat/domain/repositories/random_cat_repository.dart';

const catHost = 'https://cataas.com';
const randomCatEndpoint = '/cat?json=true';

class ApiRandomCatRepository implements RandomCatRepository {
  @override
  Future<RandomCat> fetchRandomCat() async {
    try {
      final response = await http.get(
        Uri.parse('$catHost$randomCatEndpoint'),
      );
      final jsonResponse = json.decode(response.body);

      final randomCat =
          RandomCat.fromJson(jsonResponse as Map<String, dynamic>);
      return randomCat;
    } catch (e) {
      throw Exception();
    }
  }
}
