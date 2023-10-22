import 'package:http/http.dart';
import 'package:sbc_kyc_form/model/get_cust_local_info.dart';

class ServicesApi {
  Future<GetCustLocalInfoModel> getCustLocalInfo(String uuid) async {
    try {
      String getUrl =
          'https://androiddev.sevenup.org/cs/api/Customer/GetCustomerLocalInfo/$uuid';
      var response = await get(Uri.parse(getUrl));
      // print(response.statusCode);
      if (response.statusCode == 200) {
        var body = response.body;
        GetCustLocalInfoModel getcustLocInfo =
            getCustLocalInfoModelFromJson(body);
        return getcustLocInfo;
      } else {
        throw Exception(
            "Unable to retrieve data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Unable to retrieve data: $error");
    }
  }
}
