import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:bilheteria_panucci/models/movie.dart';

class HomeService {
  Future<List<Movie>> fetchMovies() async {
    final String jsonString = await rootBundle.loadString('lib/movies.json');
    final json = jsonDecode(jsonString);

    return List<Movie>.from(json['filmes'].map((elemento) {
      return Movie.fromJson(elemento);
    }));
  }

  Future<List<Movie>> fetchMoviesByGenre(String genre) async {
    final String jsonString = await rootBundle.loadString('lib/movies.json');
    final json = jsonDecode(jsonString);

    final list = List<Movie>.from(json['filmes'].map((elemento) {
      return Movie.fromJson(elemento);
    }));

    return list.where((element) => element.genre == genre).toList();
  }
}
