import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oh_my_cat/features/random_cat/domain/blocs/random_cat_bloc.dart';
import 'package:oh_my_cat/features/random_cat/domain/blocs/random_cat_state.dart';
import 'package:oh_my_cat/features/random_cat/infrastructure/repositories/api_random_cat_repository.dart.dart';
import 'package:oh_my_cat/l10n/l10n.dart';

class RandomCatPage extends StatelessWidget {
  const RandomCatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RandomCatCubit(
        repository: ApiRandomCatRepository(),
      ),
      child: const RandomCatView(),
    );
  }
}

class RandomCatView extends StatelessWidget {
  const RandomCatView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.appBarTitle)),
      body: BlocBuilder<RandomCatCubit, RandomCatState>(
        builder: (context, state) {
          if (state is RandomCatInitial) {
            context.read<RandomCatCubit>().fetchRandomCat();
          }
          if (state is RandomCatError) {
            return const Center(
              child: DefaultImage(),
            );
          } else if (state is RandomCatSuccess) {
            return Center(
              child: SuccessImage(
                url: state.randomCat.url,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class SuccessImage extends StatelessWidget {
  const SuccessImage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$catHost$url'),
        const SizedBox(height: 20),
        Image.network(
          '$catHost$url',
        ),
      ],
    );
  }
}

class DefaultImage extends StatelessWidget {
  const DefaultImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/placeholder_cat.jpeg');
  }
}
