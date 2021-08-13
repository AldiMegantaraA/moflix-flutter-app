import 'package:equatable/equatable.dart';

class MovieDetailEntity extends Equatable {
  final int id;
  final String title;
  final String? overview;
  final String? releaseDate;
  final num? voteAverage;
  final String? backdropPath;
  final String posterPath;
  final int budget;
  final int? voteCount;
  final String tagline;
  final int revenue;
  final int runtime;
  final double? popularity;

  const MovieDetailEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.backdropPath,
    required this.posterPath,
    required this.budget,
    required this.voteCount,
    required this.tagline,
    required this.revenue,
    required this.runtime,
    required this.popularity,
  });

  @override
  List<Object> get props => [id];
}
