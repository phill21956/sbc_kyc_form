// To parse this JSON data, do
//
//     final getCustLocalInfoModel = getCustLocalInfoModelFromJson(jsonString);

import 'dart:convert';

GetCustLocalInfoModel getCustLocalInfoModelFromJson(String str) =>
    GetCustLocalInfoModel.fromJson(json.decode(str));

String getCustLocalInfoModelToJson(GetCustLocalInfoModel data) =>
    json.encode(data.toJson());

class GetCustLocalInfoModel {
  String uid;
  String customerCode;
  dynamic sapCustomerCode;
  String businessName;
  String ownerName;
  String email;
  String phoneNumber;
  String address;
  List<CustomerTdi> customerTdIs;

  GetCustLocalInfoModel({
    required this.uid,
    required this.customerCode,
    this.sapCustomerCode,
    required this.businessName,
    required this.ownerName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.customerTdIs,
  });

  factory GetCustLocalInfoModel.fromJson(Map<String, dynamic> json) =>
      GetCustLocalInfoModel(
        uid: json["uid"],
        customerCode: json["customerCode"],
        sapCustomerCode: json["sapCustomerCode"],
        businessName: json["businessName"],
        ownerName: json["ownerName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        customerTdIs: List<CustomerTdi>.from(
            json["customerTDIs"].map((x) => CustomerTdi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "customerCode": customerCode,
        "sapCustomerCode": sapCustomerCode,
        "businessName": businessName,
        "ownerName": ownerName,
        "email": email,
        "phoneNumber": phoneNumber,
        "address": address,
        "customerTDIs": List<dynamic>.from(customerTdIs.map((x) => x.toJson())),
      };
  @override
  String toString() {
    // TODO: implement toString
    return 'CustLocal(uuid:$uid,custCode:$customerCode)';
  }
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
