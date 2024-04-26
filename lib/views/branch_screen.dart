import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BranchScreen extends StatefulWidget {
  @override
  _BranchScreenState createState() => _BranchScreenState();

  static fromJson(json) {}
}

class _BranchScreenState extends State<BranchScreen> {
  Office? headOffice;
  List<Office> branchOffices = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          "https://raw.githubusercontent.com/technologychannel/PracticeAPI/main/army_training_branch.json"));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          headOffice = Office.fromJson(jsonData['headOffice']);
          branchOffices = List<Office>.from(
              jsonData['branchOffices'].map((x) => Office.fromJson(x)));
        });
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Branch',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[900],
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: const Color.fromARGB(255, 222, 247, 224),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: [
            if (headOffice != null) ...[
              OfficeCard(office: headOffice!, isHeadOffice: true),
              SizedBox(height: 1),
            ],
            ...branchOffices
                .map(
                    (office) => OfficeCard(office: office, isHeadOffice: false))
                .toList(),
          ],
        ),
      ),
    );
  }
}

class Office {
  final int? id;
  final String location;
  final String? telephone;
  final String mobile;
  final String? email;

  Office({
    this.id,
    required this.location,
    this.telephone,
    required this.mobile,
    this.email,
  });

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      id: json['id'],
      location: json['location'],
      telephone: json['telephone'],
      mobile: json['mobile'],
      email: json['email'],
    );
  }
}

class OfficeCard extends StatelessWidget {
  final Office office;
  final bool isHeadOffice;

  OfficeCard({
    required this.office,
    required this.isHeadOffice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(200, 247, 244, 244),
      child: ListTile(
        leading: Icon(Icons.location_city),
        title: Text(office.location),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mobile: ${office.mobile}'),
            if (office.telephone != null)
              Text('Telephone: ${office.telephone}'),
            if (office.email != null) Text('Email: ${office.email}'),
            if (isHeadOffice) Text('(Head Office)'),
          ],
        ),
      ),
    );
  }
}
