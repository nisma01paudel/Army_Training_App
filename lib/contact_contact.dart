import 'dart:convert';

import 'package:armyapp/views/contact_screen.dart';
import 'package:http/http.dart' as http;

class OnlineService {
  // Load and Decode JSON
  Future<List<ContactScreen>> getQuotes() async {
    // Load JSON
    final response = await http
        .get(Uri.parse('https://jsonguide.technologychannel.org/quotes.json'));

    // Decode JSON
    final json = jsonDecode(response.body).cast<Map<String, dynamic>>();

    // Convert JSON to Quote
    return json
        .map<ContactScreen>((json) => ContactScreen.fromJson(json))
        .toList();
  }
}
