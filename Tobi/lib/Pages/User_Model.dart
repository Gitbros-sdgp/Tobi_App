import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.fName,
    this.lName,
  });

  String fName;
  String lName;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        fName: json["fName"],
        lName: json["lName"],
      );

  Map<String, dynamic> toJson() => {
        "username": fName,
        "password": lName,
      };
}
