import 'package:app_filmes/models/genre_models.dart';

abstract class GenresService {
  Future<List<GenreModels>> getGenres();
}
