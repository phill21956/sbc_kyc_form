// To parse this JSON data, do
//
//     final customerInfoModel = customerInfoModelFromJson(jsonString);

import 'dart:convert';

CustomerInfoModel customerInfoModelFromJson(String str) =>
    CustomerInfoModel.fromJson(json.decode(str));

String customerInfoModelToJson(CustomerInfoModel data) =>
    json.encode(data.toJson());

class CustomerInfoModel {
  String uid;
  String firstName;
  String lastName;
  String otherNames;
  String email;
  String phoneNumber;
  String businessName;
  String businessAddress;
  bool isOfficeAddress;
  bool receiveAllNotifications;
  String registeredCompanyNumber;
  String coperateAffairsCommission;
  String taxIdentificationNumber;
  List<CustomerTdi> customerTdIs;
  CustomerLanguage customerLanguage;
  List<CustomerWarehouse> customerWarehouses;

  CustomerInfoModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.otherNames,
    required this.email,
    required this.phoneNumber,
    required this.businessName,
    required this.businessAddress,
    required this.isOfficeAddress,
    required this.receiveAllNotifications,
    required this.registeredCompanyNumber,
    required this.coperateAffairsCommission,
    required this.taxIdentificationNumber,
    required this.customerTdIs,
    required this.customerLanguage,
    required this.customerWarehouses,
  });

  factory CustomerInfoModel.fromJson(Map<String, dynamic> json) =>
      CustomerInfoModel(
        uid: json["uid"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        otherNames: json["otherNames"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        businessName: json["businessName"],
        businessAddress: json["businessAddress"],
        isOfficeAddress: json["isOfficeAddress"],
        receiveAllNotifications: json["receiveAllNotifications"],
        registeredCompanyNumber: json["registeredCompanyNumber"],
        coperateAffairsCommission: json["coperateAffairsCommission"],
        taxIdentificationNumber: json["taxIdentificationNumber"],
        customerTdIs: List<CustomerTdi>.from(
            json["customerTDIs"].map((x) => CustomerTdi.fromJson(x))),
        customerLanguage: CustomerLanguage.fromJson(json["customerLanguage"]),
        customerWarehouses: List<CustomerWarehouse>.from(
            json["customerWarehouses"]
                .map((x) => CustomerWarehouse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "firstName": firstName,
        "lastName": lastName,
        "otherNames": otherNames,
        "email": email,
        "phoneNumber": phoneNumber,
        "businessName": businessName,
        "businessAddress": businessAddress,
        "isOfficeAddress": isOfficeAddress,
        "receiveAllNotifications": receiveAllNotifications,
        "registeredCompanyNumber": registeredCompanyNumber,
        "coperateAffairsCommission": coperateAffairsCommission,
        "taxIdentificationNumber": taxIdentificationNumber,
        "customerTDIs": List<dynamic>.from(customerTdIs.map((x) => x.toJson())),
        "customerLanguage": customerLanguage.toJson(),
        "customerWarehouses":
            List<dynamic>.from(customerWarehouses.map((x) => x.toJson())),
      };
}

class CustomerLanguage {
  bool english;
  bool yoruba;
  bool hausa;
  bool igbo;
  bool pidgin;

  CustomerLanguage({
    required this.english,
    required this.yoruba,
    required this.hausa,
    required this.igbo,
    required this.pidgin,
  });

  factory CustomerLanguage.fromJson(Map<String, dynamic> json) =>
      CustomerLanguage(
        english: json["english"],
        yoruba: json["yoruba"],
        hausa: json["hausa"],
        igbo: json["igbo"],
        pidgin: json["pidgin"],
      );

  Map<String, dynamic> toJson() => {
        "english": english,
        "yoruba": yoruba,
        "hausa": hausa,
        "igbo": igbo,
        "pidgin": pidgin,
      };
}

class CustomerTdi {
  String tdiCode;
  String tdiName;
  String tdiAddress;

  CustomerTdi({
    required this.tdiCode,
    required this.tdiName,
    required this.tdiAddress,
  });

  factory CustomerTdi.fromJson(Map<String, dynamic> json) => CustomerTdi(
        tdiCode: json["tdiCode"],
        tdiName: json["tdiName"],
        tdiAddress: json["tdiAddress"],
      );

  Map<String, dynamic> toJson() => {
        "tdiCode": tdiCode,
        "tdiName": tdiName,
        "tdiAddress": tdiAddress,
      };
}

class CustomerWarehouse {
  bool isMainWarehouse;
  String address;
  String state;
  String lga;

  CustomerWarehouse({
    required this.isMainWarehouse,
    required this.address,
    required this.state,
    required this.lga,
  });

  factory CustomerWarehouse.fromJson(Map<String, dynamic> json) =>
      CustomerWarehouse(
        isMainWarehouse: json["isMainWarehouse"],
        address: json["address"],
        state: json["state"],
        lga: json["lga"],
      );

  Map<String, dynamic> toJson() => {
        "isMainWarehouse": isMainWarehouse,
        "address": address,
        "state": state,
        "lga": lga,
      };
}
