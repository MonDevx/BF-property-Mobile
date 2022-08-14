

import '../../../data/models/real_estate_model.dart';

abstract class IHomeRepository {
  Future<List<RealEstateModel>> getRealestateRecommendList();

}