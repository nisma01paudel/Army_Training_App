// service_screen.dart
import 'package:armyapp/models/servicemodel.dart';
import 'package:armyapp/service_service.dart';
import 'package:flutter/material.dart';

class ServiceScreen extends StatefulWidget {
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  late Future<List<ServiceModel>> _services;

  @override
  void initState() {
    super.initState();
    _services = ApiService().fetchServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Army Training Services',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green[900],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: FutureBuilder<List<ServiceModel>>(
        future: _services,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              ServiceModel service = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: Card(
                  margin: EdgeInsets.symmetric(),
                  elevation: 20,
                  child: ListTile(
                    title: Text(service.name),
                    subtitle: Text(service.description),
                    leading: Icon(Icons.info),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
