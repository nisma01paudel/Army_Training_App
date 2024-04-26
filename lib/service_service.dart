import 'dart:convert';
import 'package:armyapp/models/servicemodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl =
      "https://raw.githubusercontent.com/technologychannel/PracticeAPI/main/army_training_services.json";

  Future<List<ServiceModel>> fetchServices() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> servicesJson = json.decode(response.body)['services'];
      return servicesJson.map((json) => ServiceModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load services');
    }
  }
}
