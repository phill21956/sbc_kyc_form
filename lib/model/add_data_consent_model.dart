// To parse this JSON data, do
//
//     final addDataConsentModel = addDataConsentModelFromJson(jsonString);

import 'dart:convert';

AddDataConsentModel addDataConsentModelFromJson(String str) =>
    AddDataConsentModel.fromJson(json.decode(str));

String addDataConsentModelToJson(AddDataConsentModel data) =>
    json.encode(data.toJson());

class AddDataConsentModel {
  String uid;
  String undertakingName;
  String name;
  String signature;
  DateTime dateAccepted;
  String address;
  int version;

  AddDataConsentModel({
    required this.uid,
    required this.undertakingName,
    required this.name,
    required this.signature,
    required this.dateAccepted,
    required this.address,
    required this.version,
  });

  factory AddDataConsentModel.fromJson(Map<String, dynamic> json) =>
      AddDataConsentModel(
        uid: json["uid"],
        undertakingName: json["undertakingName"],
        name: json["name"],
        signature: json["signature"],
        dateAccepted: DateTime.parse(json["dateAccepted"]),
        address: json["address"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "undertakingName": undertakingName,
        "name": name,
        "signature": signature,
        "dateAccepted": dateAccepted.toIso8601String(),
        "address": address,
        "version": version,
      };
}
