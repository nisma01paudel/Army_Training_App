import 'dart:convert';
import 'package:http/http.dart' as http;

class OnlineService {
  Future<List<Map<String, dynamic>>> getFaqs() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/technologychannel/PracticeAPI/main/faq.json'));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(
          json.decode(response.body)['faqs']);
    } else {
      throw Exception('Failed to load FAQs');
    }
  }
}
