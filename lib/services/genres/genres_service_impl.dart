import 'package:app_filmes/models/genre_models.dart';
import 'package:app_filmes/services/genres/genres_service.dart';

import '../../repositories/genres/genres_repository.dart';

class GenresServiceImpl implements GenresService {
  final GenresRepository _genresRepository;

  GenresServiceImpl({required GenresRepository genresRepository})
      : _genresRepository = genresRepository;

  @override
  Future<List<GenreModels>> getGenres() => _genresRepository.getGenres();
}
