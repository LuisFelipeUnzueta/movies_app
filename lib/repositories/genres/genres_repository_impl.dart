import 'dart:io';

import 'package:app_filmes/aplication/rest_client/rest_client.dart';
import 'package:app_filmes/models/genre_models.dart';
import 'package:app_filmes/repositories/genres/genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;

  GenresRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<GenreModels>> getGenres() async {
    final result = await _restClient.get<List<GenreModels>>(
      '/genre/movie/list',
      decoder: (data) {
        final resultData = data['genres'];
        if (resultData != null) {
          return resultData
              .map<GenreModels>((g) => GenreModels.fromMap(g))
              .toList();
        }
        return <GenreModels>[];
      },
    );

    if (result.hasError) {
      print(result.statusText);
      throw Exception('Erro ao buscar gêneros');
    }
    return result.body ?? <GenreModels>[];
  }
}
