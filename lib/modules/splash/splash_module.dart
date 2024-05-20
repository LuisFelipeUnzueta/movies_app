import 'package:app_filmes/aplication/modules/module.dart';
import 'package:app_filmes/modules/splash/splash_binding.dart';
import 'package:app_filmes/modules/splash/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => SplashPage(),
      binding: SplashBinding(),
    )
  ];
}
