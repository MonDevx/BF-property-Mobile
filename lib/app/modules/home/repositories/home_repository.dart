import 'package:bfproperty/app/data/models/real_estate_model.dart';

import '../interface/home_interface.dart';
import '../services/home_service.dart';

class HomeRepository implements IHomeRepository {
  final HomeService homeService = HomeService();
  HomeRepository({homeService});

  @override
  Future<List<RealEstateModel>> getRealestateRecommendList() async {
    var respone = await homeService.fetchRealestate();
    return respone;
  }
}
