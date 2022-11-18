import 'package:equatable/equatable.dart';

class RandomCat extends Equatable {
  const RandomCat({
    required this.url,
  });

  factory RandomCat.fromJson(Map<String, dynamic> json) {
    return RandomCat(
      url: json['url'] as String,
    );
  }
  final String url;

  @override
  String toString() {
    return 'RandomCat{url: $url}';
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  @override
  List<Object?> get props => [url];
}
