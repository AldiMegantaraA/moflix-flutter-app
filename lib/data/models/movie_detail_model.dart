import '../../domain/entities/movie_detail_entity.dart';

class MovieDetailModel extends MovieDetailEntity {
  final bool? adult;
  final String? backdropPath;
  final int id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String posterPath;
  final String? releaseDate;
  final String title;
  final bool? video;
  final num? voteAverage;
  final int? voteCount;
  final int budget;
  final int revenue;
  final String tagline;
  final int runtime;

  MovieDetailModel(
      {this.adult,
      this.backdropPath,
      required this.id,
      required this.budget,
      required this.revenue,
      required this.tagline,
      required this.runtime,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      required this.posterPath,
      this.releaseDate,
      required this.title,
      this.video,
      this.voteAverage,
      this.voteCount})
      : super(
          id: id,
          title: title,
          releaseDate: releaseDate,
          overview: overview,
          voteAverage: voteAverage,
          backdropPath: backdropPath,
          posterPath: posterPath,
          budget: budget,
          voteCount: voteCount,
          revenue: revenue,
          tagline: tagline,
          popularity: popularity,
          runtime: runtime
        );

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      id: json['id'] ?? -1,
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'],
      title: json['title'] ?? '',
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      budget: json['budget'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      tagline: json['tagline'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['budget'] = this.budget;
    return data;
  }
}

_genres(Map<String, dynamic> json) {
  if (json['genres'] != null) {
    final genres = List<Genres>.empty(growable: true);
    json['genres'].forEach((v) {
      genres.add(new Genres.fromJson(v));
    });
  }
}

class BelongsToCollection {
  late int? id;
  late String? name;
  late String? posterPath;
  late String? backdropPath;
  late int? budget;

  BelongsToCollection({this.id, this.name, this.posterPath, this.backdropPath});

  BelongsToCollection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
    budget = json['budget'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['poster_path'] = this.posterPath;
    data['backdrop_path'] = this.backdropPath;
    data['budget'] = this.budget;
    return data;
  }
}

class Genres {
  late int? id;
  late String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class ProductionCompanies {
  late int? id;
  late String? logoPath;
  late String? name;
  late String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo_path'] = this.logoPath;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    return data;
  }
}

class ProductionCountries {
  late String? iso31661;
  late String? name;

  ProductionCountries({this.iso31661, this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    return data;
  }
}

class SpokenLanguages {
  late String? iso6391;
  late String? name;

  SpokenLanguages({this.iso6391, this.name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_639_1'] = this.iso6391;
    data['name'] = this.name;
    return data;
  }
}
