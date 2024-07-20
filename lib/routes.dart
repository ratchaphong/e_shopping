import 'package:get/get.dart';

import 'views/login/login_screen.dart';
import 'views/splash_screen.dart';

class Routes {
  static final routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
  ];
}
