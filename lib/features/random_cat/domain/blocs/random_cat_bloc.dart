import 'package:bloc/bloc.dart';
import 'package:oh_my_cat/features/random_cat/domain/blocs/random_cat_state.dart';
import 'package:oh_my_cat/features/random_cat/domain/repositories/random_cat_repository.dart';

class RandomCatCubit extends Cubit<RandomCatState> {
  RandomCatCubit({required this.repository}) : super(const RandomCatInitial());

  final RandomCatRepository repository;

  Future<void> fetchRandomCat() async {
    try {
      final cat = await repository.fetchRandomCat();
      emit(
        RandomCatSuccess(randomCat: cat),
      );
    } catch (e) {
      emit(
        const RandomCatError(),
      );
    }
  }
}
