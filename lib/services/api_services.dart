import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chatgpttry/models/models_model.dart';
import 'package:http/http.dart' as http;

import '../constants/api_constant.dart';

class ApiServices {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse(
          '$baseUrl/v1/models',
        ),
        headers: {'Authorization': ' Bearer $apiKey'},
      );
      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }
      // print(jsonResponse);
      List temp = [];
      for (var value in jsonResponse['data']) {
        temp.add(value);
        String myvalue = jsonEncode(value);
        log("logged here ${value['id']}");
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (error) {
      log("error ${error}");
      rethrow;
    }
  }
}
