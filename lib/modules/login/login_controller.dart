import 'package:app_filmes/aplication/ui/loader/loader_mixin.dart';
import 'package:app_filmes/aplication/ui/messages/messages_mixin.dart';
import 'package:app_filmes/services/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
//var nome = 'Luis Unzueta'.obs;
//RxString nome = RxString('Luis Unzueta');
// var nome = Rx<String>('Luis Unzueta')

  final loading = false.obs;
  final message = Rxn<MessageModel>();
  final LoginService _loginService;

  LoginController({required LoginService loginService})
      : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListner(loading);
    messageListner(message);
  }

  Future<void> login() async {
    try {
      //loading(true);
      loading.value = true;

      await _loginService.login();

      loading(false);

      message(MessageModel.info(
          title: 'Sucesso', message: "Login realizado com sucesso"));

      // no getx pode ser feito assim: await 2.seconds.delay();
      //await Future.delayed(const Duration(seconds: 2));

    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(MessageModel.error(
          title: 'Login Erro', message: "Erro ao realizar o login"));
    }
  }
}
