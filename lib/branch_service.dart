import 'dart:convert';
import 'package:armyapp/views/branch_screen.dart';
import 'package:http/http.dart' as http;

class Branches {
  // Load and Decode JSON
  Future<List<BranchScreen>> getQuotes() async {
    // Load JSON
    final response = await http.get(Uri.parse('url'));

    // Decode JSON
    final json = jsonDecode(response.body).cast<Map<String, dynamic>>();

    // Convert JSON to Quote
    return json
        .map<BranchScreen>((json) => BranchScreen.fromJson(json))
        .toList();
  }
}
