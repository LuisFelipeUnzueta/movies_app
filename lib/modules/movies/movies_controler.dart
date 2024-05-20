import 'package:app_filmes/aplication/ui/messages/messages_mixin.dart';
import 'package:app_filmes/models/genre_models.dart';
import 'package:app_filmes/services/genres/genres_service.dart';
import 'package:get/get.dart';

class MoviesControler extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final _message = Rxn<MessageModel>();
  final genres = <GenreModels>[].obs;

  MoviesControler({required GenresService genresService})
      : _genresService = genresService;

  @override
  void onInit() {
    super.onInit();
    messageListner(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final genres = await _genresService.getGenres();
      genres.assignAll(genres);
    } catch (e) {
      _message(MessageModel.error(
          title: 'Erro', message: 'Erro ao buscar Categorias'));
    }
  }
}
