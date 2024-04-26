import 'dart:convert';

import 'package:armyapp/views/branch_screen.dart';

BranchScreen BranchFromJson(String str) => BranchFromJson(json.decode(str));

String contactUsToJson(Branch data) => json.encode(data.toJson());

class Branch {
  Office headOffice;
  List<Office> branchOffices;

  Branch({
    required this.headOffice,
    required this.branchOffices,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        headOffice: Office.fromJson(json["headOffice"]),
        branchOffices: List<Office>.from(
            json["branchOffices"].map((x) => Office.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "headOffice": headOffice.toJson(),
        "branchOffices":
            List<dynamic>.from(branchOffices.map((x) => x.toJson())),
      };
}

class Office {
  int? id;
  String location;
  String? telephone;
  String mobile;
  String? email;

  Office({
    this.id,
    required this.location,
    this.telephone,
    required this.mobile,
    this.email,
  });

  factory Office.fromJson(Map<String, dynamic> json) => Office(
        id: json["id"],
        location: json["location"],
        telephone: json["telephone"],
        mobile: json["mobile"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "location": location,
        "telephone": telephone,
        "mobile": mobile,
        "email": email,
      };
}
