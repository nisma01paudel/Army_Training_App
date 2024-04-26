// service_model.dart
class ServiceModel {
  final int id;
  final String name;
  final String description;

  ServiceModel(
      {required this.id, required this.name, required this.description});

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
