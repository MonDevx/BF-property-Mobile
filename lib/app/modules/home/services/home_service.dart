import 'dart:convert';

import 'package:bfproperty/app/data/models/real_estate_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

import '../../../core/configs/app_config.dart';

class HomeService extends GetxService {
  Future<List<RealEstateModel>> fetchRealestate() async {
    final response =
        await http.get(Uri.parse('${apiBaseUrl}realestaterecommendlist'));
    if (response.statusCode == 200) {
      return compute(parseRealEstates, response.body);
    } else {
      List<RealEstateModel> emptyList = [];
      return emptyList;
    }
  }

  List<RealEstateModel> parseRealEstates(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<RealEstateModel>((json) => RealEstateModel.fromJson(json))
        .toList();
  }
}
