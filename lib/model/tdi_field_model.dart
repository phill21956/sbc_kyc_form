class TdiFieldData {
  String? tdiCode;
  String? tdiName;
  String? tdiAddress;

  TdiFieldData({this.tdiCode, this.tdiName, this.tdiAddress});

  // Convert the instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'tdiCode': tdiCode,
      'tdiName': tdiName,
      'tdiAddress': tdiAddress,
    };
  }

  // Create an instance from a JSON map
  factory TdiFieldData.fromJson(Map<String, dynamic> json) {
    return TdiFieldData(
      tdiCode: json['tdiCode'] ?? '',
      tdiName: json['tdiName'] ?? '',
      tdiAddress: json['tdiAddress'] ?? '',
    );
  }
}
