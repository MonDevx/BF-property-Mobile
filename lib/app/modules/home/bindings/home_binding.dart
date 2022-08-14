import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../repositories/home_repository.dart';
import '../services/home_service.dart';

class HomeBinding implements Bindings{
  final HomeRepository homeRepository = HomeRepository(homeService: HomeService());
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(repository: homeRepository);
    });
  }

}