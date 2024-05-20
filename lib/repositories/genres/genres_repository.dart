import 'package:app_filmes/models/genre_models.dart';

abstract class GenresRepository {
  Future<List<GenreModels>> getGenres();
}
