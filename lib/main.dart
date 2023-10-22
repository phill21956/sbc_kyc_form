import 'package:flutter/material.dart';
import 'package:sbc_kyc_form/model/get_cust_local_info.dart';
import 'package:sbc_kyc_form/pages/home_page.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sbc_kyc_form/services/http_call.dart';
import 'package:http/http.dart';
import 'package:sbc_kyc_form/services/shared_pref.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:universal_html/html.dart' as html;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SharedPref _sharedPref = SharedPref();
  late String generatedGuid;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    generatedGuid = 'f57b3ea8-5816-4fbf-bac3-793971f5ee89';
    //_sharedPref.clear();
    // generatedGuid = getGeneratedGuid();
    print('shahdhjsd: $generatedGuid');
    setState(() {
      getCustLocalInfo(generatedGuid);
    });
  }

  String getGeneratedGuid() {
    final uri = html.window.location.href;
    final queryParameters = Uri.parse(uri).queryParameters;
    final guid = queryParameters['guid'];
    return guid ?? const Uuid().v4();
  }

  Future<GetCustLocalInfoModel> getCustLocalInfo(String uuid) async {
    try {
      String getUrl =
          'https://androiddev.sevenup.org/cs/api/Customer/GetCustomerLocalInfo/$uuid';
      //  print('1234: $getUrl');
      var response = await get(Uri.parse(getUrl));
      // print("${response.statusCode}: ${response.body}");
      if (response.statusCode == 200) {
        var body = response.body;
        GetCustLocalInfoModel getcustLocInfo =
            getCustLocalInfoModelFromJson(body);
        String getCustInfo = getCustLocalInfoModelToJson(getcustLocInfo);
        _sharedPref.save('CUST_INFO', getCustInfo);
        return getcustLocInfo;
      } else {
        throw Exception(
            "Unable to retrieve data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Unable to retrieve data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SBC KYC FORM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}
