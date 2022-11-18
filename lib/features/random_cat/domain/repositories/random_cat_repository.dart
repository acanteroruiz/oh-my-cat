import 'package:oh_my_cat/features/random_cat/domain/models/random_cat.dart';

abstract class RandomCatRepository {
  Future<RandomCat> fetchRandomCat();
}
