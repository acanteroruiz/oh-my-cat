import 'package:equatable/equatable.dart';
import 'package:oh_my_cat/features/random_cat/domain/models/random_cat.dart';

class RandomCatState extends Equatable {
  const RandomCatState();

  @override
  List<Object> get props => [];
}

class RandomCatInitial extends RandomCatState {
  const RandomCatInitial();
}

class RandomCatSuccess extends RandomCatState {
  const RandomCatSuccess({
    required this.randomCat,
  });

  final RandomCat randomCat;

  @override
  List<Object> get props => [randomCat];
}

class RandomCatError extends RandomCatState {
  const RandomCatError();
}
