import 'package:armyapp/faq_service.dart';
import 'package:armyapp/models/faqmodel.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FAQScreen> {
  List<FAQ> _faqs = [];
  OnlineService _onlineService = OnlineService();

  @override
  void initState() {
    super.initState();
    _loadFaqs();
  }

  Future<void> _loadFaqs() async {
    try {
      final faqs = await _onlineService.getFaqs();
      setState(() {
        _faqs = faqs.map((faqJson) => FAQ.fromJson(faqJson)).toList();
      });
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Frequently Asked Questions',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green[900],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _faqs.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _faqs.length,
              itemBuilder: (context, index) {
                return FAQTile(
                  faq: _faqs[index],
                );
              },
            ),
    );
  }
}

class FAQTile extends StatefulWidget {
  final FAQ faq;

  const FAQTile({required this.faq});

  @override
  _FAQTileState createState() => _FAQTileState();
}

class _FAQTileState extends State<FAQTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: [
          Icon(
            Icons.question_answer,
            color: Colors.green[900],
          ),
          SizedBox(width: 8), // Adjust spacing between icon and text
          Text(
            widget.faq.question,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      children: [
        Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Card(
                elevation: 4, // Add elevation for a shadow effect
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Flexible(
                    child: Text(
                      widget.faq.answer,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
      onExpansionChanged: (value) {
        setState(() {
          _isExpanded = value;
        });
      },
      initiallyExpanded: _isExpanded,
    );
  }
}
