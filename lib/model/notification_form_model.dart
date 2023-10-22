// To parse this JSON data, do
//
//     final notificationFieldData = notificationFieldDataFromJson(jsonString);

import 'dart:convert';

NotificationFieldData notificationFieldDataFromJson(String str) =>
    NotificationFieldData.fromJson(json.decode(str));

String notificationFieldDataToJson(NotificationFieldData data) =>
    json.encode(data.toJson());

class NotificationFieldData {
  String? name;
  String? phoneNumber;
  String? email;
  bool? billing;
  bool? paymentAuthentication;
  bool? confirmDelivery;
  bool? isEnglish;
  bool? isYoruba;
  bool? isHausa;
  bool? isIgbo;
  bool? isPidgin;

  NotificationFieldData({
    this.name,
    this.phoneNumber,
    this.email,
    this.billing,
    this.paymentAuthentication,
    this.confirmDelivery,
    this.isEnglish,
    this.isYoruba,
    this.isHausa,
    this.isIgbo,
    this.isPidgin,
  });

  factory NotificationFieldData.fromJson(Map<String, dynamic> json) =>
      NotificationFieldData(
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        billing: json["billing"],
        paymentAuthentication: json["paymentAuthentication"],
        confirmDelivery: json["confirmDelivery"],
        isEnglish: json["isEnglish"],
        isYoruba: json["isYoruba"],
        isHausa: json["isHausa"],
        isIgbo: json["isIgbo"],
        isPidgin: json["isPidgin"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phoneNumber": phoneNumber,
        "email": email,
        "billing": billing,
        "paymentAuthentication": paymentAuthentication,
        "confirmDelivery": confirmDelivery,
        "isEnglish": isEnglish,
        "isYoruba": isYoruba,
        "isHausa": isHausa,
        "isIgbo": isIgbo,
        "isPidgin": isPidgin,
      };
}
