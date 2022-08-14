import 'package:get/get.dart';

import '../../../data/models/real_estate_model.dart';
import '../repositories/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  HomeController({required this.repository});

  Future<List<RealEstateModel>> getRealestateRecommendList() async {
    var respone = await repository.getRealestateRecommendList();
    return respone;
  }
}
