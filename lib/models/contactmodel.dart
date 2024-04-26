import 'dart:convert';

ContactUs contactUsFromJson(String str) => ContactUs.fromJson(json.decode(str));

String contactUsToJson(ContactUs data) => json.encode(data.toJson());

class ContactUs {
  Office headOffice;
  List<Office> branchOffices;

  ContactUs({
    required this.headOffice,
    required this.branchOffices,
  });

  factory ContactUs.fromJson(Map<String, dynamic> json) => ContactUs(
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
