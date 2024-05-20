import 'package:app_filmes/modules/favorites/favorites_page.dart';
import 'package:app_filmes/modules/home/home_controller.dart';
import 'package:app_filmes/modules/movies/movies_bindings.dart';
import 'package:app_filmes/modules/movies/movies_page.dart';
import 'package:flutter/material.dart';
import 'package:app_filmes/aplication/ui/theme_extensions.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
            selectedItemColor: context.themeRed,
            unselectedItemColor: Colors.grey,
            currentIndex: controller.pageIndex,
            onTap: controller.goToPage,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Filmes'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline), label: 'Favoritos'),
              BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Sair')
            ]);
      }),
      body: Navigator(
        initialRoute: '/movies',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          if (settings.name == '/movies') {
            return GetPageRoute(
              settings: settings,
              page: () => const MoviesPage(),
              binding: MoviesBindings(),
            );
          }

          if (settings.name == '/favorites') {
            return GetPageRoute(
                settings: settings, page: () => const FavoritesPage());
          }

          return null;
        },
      ),
    );
  }
}
