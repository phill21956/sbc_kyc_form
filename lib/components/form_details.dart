import 'package:flutter/material.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';
import 'package:sbc_kyc_form/components/notification_formwidget.dart';
import 'package:sbc_kyc_form/components/other_whs_widget.dart';
import 'package:sbc_kyc_form/components/tdi_info_widget.dart';
import 'package:sbc_kyc_form/main.dart';
import 'package:sbc_kyc_form/model/customer_info_model.dart';
import 'package:sbc_kyc_form/model/form_field_model.dart';
import 'package:sbc_kyc_form/model/notification_form_model.dart';
import 'package:sbc_kyc_form/model/tdi_field_model.dart';
import 'package:sbc_kyc_form/model/get_cust_local_info.dart';
import 'package:http/http.dart' as http;
import '../model/get_cust_local_info.dart';
import '../pages/home_page.dart';
import '../services/shared_pref.dart';
import 'package:sbc_kyc_form/model/customer_info_model.dart' as customer_info;
import 'package:sbc_kyc_form/model/get_cust_local_info.dart' as get_cust_local;

class FormDetailsWidget extends StatefulWidget {
  FormDetailsWidget({
    super.key,
  });

  @override
  State<FormDetailsWidget> createState() => _FormDetailsWidgetState();
}

class _FormDetailsWidgetState extends State<FormDetailsWidget> {
  final TextEditingController navCodeController = TextEditingController();
  final TextEditingController sapCodeController = TextEditingController();
  final TextEditingController ownersFirstNameController =
      TextEditingController();
  final TextEditingController ownersLastNameController =
      TextEditingController();
  final TextEditingController ownersOtherNameController =
      TextEditingController();
  final TextEditingController ownersPhoneNumbController =
      TextEditingController();
  final TextEditingController ownersOtherNumbController =
      TextEditingController();
  final TextEditingController ownersEmailController = TextEditingController();
  final TextEditingController busNameController = TextEditingController();
  final TextEditingController busAddressController = TextEditingController();
  final TextEditingController busPhoneNumbController = TextEditingController();
  final TextEditingController busOtherNumbController = TextEditingController();
  final TextEditingController billingNotifNameController =
      TextEditingController();
  final TextEditingController billingNotifNumbController =
      TextEditingController();
  final TextEditingController billingNotifEmailController =
      TextEditingController();
  final TextEditingController paymentAuthNameController =
      TextEditingController();
  final TextEditingController paymentAuthNumbController =
      TextEditingController();
  final TextEditingController paymentAuthEmailController =
      TextEditingController();
  final TextEditingController confirmDeliveryNameController =
      TextEditingController();
  final TextEditingController confirmDeliveryNumbController =
      TextEditingController();
  final TextEditingController confirmDeliveryEmailController =
      TextEditingController();
  final TextEditingController rcNumberController = TextEditingController();
  final TextEditingController cacNumberController = TextEditingController();
  final TextEditingController tinNumberController = TextEditingController();
  final TextEditingController mainWhsAddressController =
      TextEditingController();
  final TextEditingController mainWhsStateController = TextEditingController();
  final TextEditingController mainWhsLgaController = TextEditingController();
  final TextEditingController otherWhsAddressController =
      TextEditingController();
  final TextEditingController otherWhsStateController = TextEditingController();
  final TextEditingController otherWhsLgaController = TextEditingController();
  final TextEditingController tdiCodeController = TextEditingController();
  final TextEditingController tdiNameController = TextEditingController();
  final TextEditingController tdiAddressController = TextEditingController();
  bool homeChecked = false;
  bool officeChecked = false;
  bool receiveNotifications = false;
  int officeCheckOption = 0;
  bool notificationVisible = false;
  int notificationOption = 0;
  int languageOption = 0;
  bool isEnglish = false;
  bool isYoruba = false;
  bool isHausa = false;
  bool isIgbo = false;
  bool isPidgin = false;
  List<FormFieldData> formData = [];
  List<TdiFieldData> tdiData = [];
  List<NotificationFieldData> notifFieldData = [];
  List<CustomerWarehouse> whsData = [];
  List<customer_info.CustomerTdi> tdiInformationData = [];
  final SharedPref _sharedPref = SharedPref();
  final _formKey = GlobalKey<FormState>();
  late GetCustLocalInfoModel customerLocalInfo;
  String navName = '';
  String sapName = '';
  String ownerName = '';
  String phoneNumber = '';
  String emailCode = '';
  String bizName = '';
  String bizaddress = '';
  String uuid = '';
  String stateValue = NigerianStatesAndLGA.allStates[0];
  String lgaValue = 'Select a Local Government Area';
  String selectedLGAFromAllLGAs = NigerianStatesAndLGA.getAllNigerianLGAs()[0];
  List<String> statesLga = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    bool exists = await _sharedPref.find('CUST_INFO');
    print('Data exists: $exists');
    customerLocalInfo =
        getCustLocalInfoModelFromJson(await _sharedPref.read('CUST_INFO'));

    setState(() {
      addFormField();
      addTdiField();
      addNotifField();
      print(customerLocalInfo);
      ownerName = customerLocalInfo.ownerName;
      phoneNumber = customerLocalInfo.phoneNumber;
      emailCode = customerLocalInfo.email;
      bizName = customerLocalInfo.businessName;
      bizaddress = customerLocalInfo.address;
      navName = customerLocalInfo.customerCode;
      uuid = customerLocalInfo.uid;
      if (customerLocalInfo.sapCustomerCode != null) {
        sapName = customerLocalInfo.sapCustomerCode;
      } else {
        sapName = '';
      }
      // addressName = customerLocalInfo.address;
    });
  }

  void addFormField() {
    setState(() {
      formData.add(FormFieldData());
    });
  }

  void addTdiField() {
    setState(() {
      tdiData.add(TdiFieldData());
    });
  }

  void addNotifField() {
    setState(() {
      notifFieldData.add(NotificationFieldData());
    });
  }

  void removeFormField(int index) {
    if (formData.length > 1) {
      setState(() {
        formData.removeAt(index);
      });
    }
  }

  void removeTdiField(int index) {
    if (tdiData.length > 1) {
      setState(() {
        tdiData.removeAt(index);
      });
    }
  }

  void removeNotifField(int index) {
    if (notifFieldData.length > 1) {
      setState(() {
        notifFieldData.removeAt(index);
      });
    }
  }

  Future<void> createCustomerInfo(CustomerInfoModel customerInfoModel) async {
    try {
      final String customerInfo = customerInfoModelToJson(customerInfoModel);
      print(customerInfo);
      String url =
          'https://androiddev.sevenup.org/cs/api/Customer/CreateCustomerInfo';
      var response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json-patch+json',
            'accept': '*/*',
          },
          body: customerInfo);
      print("${response.statusCode} : ${response.body}");
      //print(response.body);
      if (response.statusCode == 200) {
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Successful'),
              duration: Duration(seconds: 3),
            ),
          );
        });
        Future.delayed(const Duration(seconds: 3), () {
          _sharedPref.clear();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const MyApp()));
        });
      } else {
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Not Successful'),
              duration: Duration(seconds: 3),
            ),
          );
        });
        throw Exception(
            "Unable to retrieve data. Status code: ${response.body}");
      }
    } catch (error) {
      throw Exception("Unable to retrieve data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // height: 2000,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 50, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                            text: 'Please provide your details as ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'accurately\nas possible.',
                            style: TextStyle(color: Color(0xff1A9B27)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(child: Image.asset('images/image11.png')),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "CUSTOMER CODE",
              style: TextStyle(
                color: Color(0xff06BA63),
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                        child: Text('Navision Code:'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: SizedBox(
                          width: 500,
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Color(0xff232323),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.green,
                                ),
                              ),
                              filled: true,
                              isDense: true,
                              hintText: navName,
                              enabled: false,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal:
                                      8.0), // Increase the vertical padding
                              fillColor: Colors.white,
                            ),
                            controller: navCodeController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                        child: Text('SAP Code:'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: SizedBox(
                          width: 500,
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Color(0xff232323),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.green,
                                ),
                              ),
                              filled: true,
                              isDense: true,
                              enabled: false,
                              hintText: sapName,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal:
                                      8.0), // Increase the vertical padding
                              fillColor: Colors.white,
                            ),
                            controller: sapCodeController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "OWNER'S INFORMATION",
              style: TextStyle(
                  color: Color(0xff06BA63), fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                        child: Text('First Name:'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: SizedBox(
                          width: 500,
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Color(0xff232323),
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.red,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.green,
                                ),
                              ),
                              filled: true,
                              isDense: true,
                              hintText: ownerName,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal:
                                      8.0), // Increase the vertical padding
                              fillColor: Colors.white,
                            ),
                            controller: ownersFirstNameController,
                            validator: (value) {
                              if (ownersFirstNameController.text.isEmpty) {
                                ownersFirstNameController.text = ownerName;
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                        child: Text('Last Name:'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: SizedBox(
                          width: 500,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Color(0xff232323),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.red,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.green,
                                ),
                              ),
                              filled: true,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal:
                                      8.0), // Increase the vertical padding
                              fillColor: Colors.white,
                            ),
                            controller: ownersLastNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please fill this field';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                        child: Text('Others (optional):'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: SizedBox(
                          width: 500,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Color(0xff232323),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.red,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.green,
                                ),
                              ),
                              filled: true,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal:
                                      8.0), // Increase the vertical padding
                              fillColor: Colors.white,
                            ),
                            controller: ownersOtherNameController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                        child: Text('Phone Number(s):'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: SizedBox(
                          width: 500,
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Color(0xff232323),
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.red,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.green,
                                ),
                              ),
                              filled: true,
                              isDense: true,
                              hintText: phoneNumber,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal:
                                      8.0), // Increase the vertical padding
                              fillColor: Colors.white,
                            ),
                            controller: ownersPhoneNumbController,
                            validator: (value) {
                              if (ownersPhoneNumbController.text.isEmpty) {
                                ownersPhoneNumbController.text = phoneNumber;
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                        child: Text('Others (optional):'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: SizedBox(
                          width: 500,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Color(0xff232323),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.red,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.green,
                                ),
                              ),
                              filled: true,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal:
                                      8.0), // Increase the vertical padding
                              // hintStyle: TextStyle(color: Colors.grey),
                              // hintText: "Enter Customer Code",
                              fillColor: Colors.white,
                            ),
                            controller: ownersOtherNumbController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                        child: Text('Email:'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: SizedBox(
                          width: 500,
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Color(0xff232323),
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.red,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.green,
                                ),
                              ),
                              filled: true,
                              isDense: true,
                              hintText: emailCode,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal:
                                      8.0), // Increase the vertical padding
                              fillColor: Colors.white,
                            ),
                            controller: ownersEmailController,
                            validator: (value) {
                              if (ownersEmailController.text.isEmpty) {
                                setState(() {
                                  ownersEmailController.text = emailCode;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "BUSINESS INFORMATION",
              style: TextStyle(
                  color: Color(0xff06BA63), fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                        child: Text('Business Name:'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: SizedBox(
                          width: 500,
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Color(0xff232323),
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.red,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.green,
                                ),
                              ),
                              filled: true,
                              isDense: true,
                              hintText: bizName,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal:
                                      8.0), // Increase the vertical padding
                              fillColor: Colors.white,
                            ),
                            controller: busNameController,
                            validator: (value) {
                              if (busNameController.text.isEmpty) {
                                setState(() {
                                  busNameController.text = bizName;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Business Address:'),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 30, 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: officeCheckOption == 1,
                                  onChanged: (value) {
                                    setState(() {
                                      if (value == true) {
                                        officeCheckOption = 1;
                                        officeChecked = false;
                                      } else {
                                        officeCheckOption = 0;
                                        officeChecked = false;
                                      }
                                    });
                                  },
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return Colors.green;
                                    }
                                    return Colors.green;
                                  }),
                                ),
                                const Text('Warehouse'),
                                const SizedBox(width: 16),
                                Checkbox(
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return Colors.green;
                                    }
                                    return Colors.green;
                                  }),
                                  value: officeCheckOption == 2,
                                  onChanged: (value) {
                                    setState(() {
                                      if (value == true) {
                                        officeCheckOption = 2;
                                        officeChecked = true;
                                      } else {
                                        officeCheckOption = 0;
                                        officeChecked = false;
                                      }
                                    });
                                  },
                                ),
                                const Text('Office'),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: SizedBox(
                          width: 500,
                          height: 100,
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Color(0xff232323),
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.red,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.green,
                                ),
                              ),
                              filled: true,
                              isDense: true,
                              hintText: bizaddress,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal:
                                      8.0), // Increase the vertical padding
                              fillColor: Colors.white,
                            ),
                            maxLines: 3,
                            controller: busAddressController,
                            validator: (value) {
                              if (busAddressController.text.isEmpty) {
                                setState(() {
                                  busAddressController.text = bizaddress;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                        child: Text('Business Phone Number(s):'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: SizedBox(
                          width: 500,
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Color(0xff232323),
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.red,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.green,
                                ),
                              ),
                              filled: true,
                              isDense: true,
                              hintText: phoneNumber,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal:
                                      8.0), // Increase the vertical padding
                              fillColor: Colors.white,
                            ),
                            controller: busPhoneNumbController,
                            validator: (value) {
                              if (busPhoneNumbController.text.isEmpty) {
                                setState(() {
                                  busPhoneNumbController.text = phoneNumber;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                        child: Text('Others (optional):'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: SizedBox(
                          width: 500,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Color(0xff232323),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.red,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.green,
                                ),
                              ),
                              filled: true,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal:
                                      8.0), // Increase the vertical padding
                              fillColor: Colors.white,
                            ),
                            controller: busOtherNumbController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
                'Please indicate your preferred language for communication and SMS notifications from the options below.'),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Checkbox(
                        value: languageOption == 1,
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              languageOption = 1;
                              isEnglish = true;
                            } else {
                              languageOption = 0;
                              isEnglish = false;
                            }
                          });
                        },
                        fillColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors.green;
                          }
                          return Colors.green;
                        }),
                      ),
                    ),
                    const Flexible(child: Text('English')),
                  ],
                ),
                const SizedBox(width: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Checkbox(
                        fillColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors.green;
                          }
                          return Colors.green;
                        }),
                        value: languageOption == 2,
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              languageOption = 2;
                              isYoruba = true;
                            } else {
                              languageOption = 0;
                              isYoruba = false;
                            }
                          });
                        },
                      ),
                    ),
                    const Flexible(child: Text('Yoruba')),
                  ],
                ),
                const SizedBox(width: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Checkbox(
                        fillColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors.green;
                          }
                          return Colors.green;
                        }),
                        value: languageOption == 3,
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              languageOption = 3;
                              isIgbo = true;
                            } else {
                              languageOption = 0;
                              isIgbo = false;
                            }
                          });
                        },
                      ),
                    ),
                    const Flexible(child: Text('Igbo')),
                  ],
                ),
                const SizedBox(width: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Checkbox(
                        fillColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors.green;
                          }
                          return Colors.green;
                        }),
                        value: languageOption == 4,
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              languageOption = 4;
                              isHausa = true;
                            } else {
                              languageOption = 0;
                              isHausa = false;
                            }
                          });
                        },
                      ),
                    ),
                    const Flexible(child: Text('Hausa')),
                  ],
                ),
                const SizedBox(width: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Checkbox(
                        fillColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors.green;
                          }
                          return Colors.green;
                        }),
                        value: languageOption == 5,
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              languageOption = 5;
                              isPidgin = true;
                            } else {
                              languageOption = 0;
                              isPidgin = false;
                            }
                          });
                        },
                      ),
                    ),
                    const Flexible(child: Text('Pidgin')),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
                'What notifications do you want to receive in the numbers your provided above?'),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Checkbox(
                        value: languageOption == 1,
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              languageOption = 1;
                              isEnglish = true;
                            } else {
                              languageOption = 0;
                              isEnglish = false;
                            }
                          });
                        },
                        fillColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors.green;
                          }
                          return Colors.green;
                        }),
                      ),
                    ),
                    const Flexible(child: Text('Billing Information')),
                  ],
                ),
                const SizedBox(width: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Checkbox(
                        fillColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors.green;
                          }
                          return Colors.green;
                        }),
                        value: languageOption == 2,
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              languageOption = 2;
                              isYoruba = true;
                            } else {
                              languageOption = 0;
                              isYoruba = false;
                            }
                          });
                        },
                      ),
                    ),
                    const Flexible(child: Text('Payment Authentication')),
                  ],
                ),
                const SizedBox(width: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Checkbox(
                        fillColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors.green;
                          }
                          return Colors.green;
                        }),
                        value: languageOption == 3,
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              languageOption = 3;
                              isIgbo = true;
                            } else {
                              languageOption = 0;
                              isIgbo = false;
                            }
                          });
                        },
                      ),
                    ),
                    const Flexible(child: Text('Confirm Delivery')),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
                'If you intend to authorize other people to do any of the above, please add them below'),
            const SizedBox(height: 10),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Table(
                              border: TableBorder.all(color: Colors.green),
                              children: const [
                                TableRow(children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text('Name'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text('Phone'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text('Email'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text('Notification'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text('Language'),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: addNotifField,
                            icon: const Icon(Icons.add_circle_outline_outlined),
                            color: Colors.green,
                          )
                        ],
                      ),
                      Flexible(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: notifFieldData.length,
                          itemBuilder: (context, index) {
                            return NotificationFormWidget(
                              notificationFieldData: notifFieldData[index],
                              onRemove: () => removeNotifField(index),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                        child: Text('Registered Company (RC) Number:'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: SizedBox(
                          width: 500,
                          height: 50,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Color(0xff232323),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.red,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.green,
                                ),
                              ),
                              filled: true,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal:
                                      8.0), // Increase the vertical padding
                              fillColor: Colors.white,
                            ),
                            controller: rcNumberController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please fill this field';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                        child: Text('Corporate Affairs Commission (CAC):'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: SizedBox(
                          width: 500,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Color(0xff232323),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.red,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.green,
                                ),
                              ),
                              filled: true,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal:
                                      8.0), // Increase the vertical padding
                              fillColor: Colors.white,
                            ),
                            controller: cacNumberController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please fill this field';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                        child: Text('Tax Identification Number (TIN):'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: SizedBox(
                          width: 500,
                          height: 50,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Color(0xff232323),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.red,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.green,
                                ),
                              ),
                              filled: true,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal:
                                      8.0), // Increase the vertical padding
                              fillColor: Colors.white,
                            ),
                            controller: tinNumberController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please fill this field';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                'Main warehouse address',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  // flex: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                        child: Text('Address:'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: SizedBox(
                          width: 500,
                          height: 100,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Color(0xff232323),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.red,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.green,
                                ),
                              ),
                              filled: true,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal:
                                      8.0), // Increase the vertical padding
                              fillColor: Colors.white,
                            ),
                            maxLines: 3,
                            controller: mainWhsAddressController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please fill this field';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                        child: Text('State:'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: SizedBox(
                          width: 500,
                          child: DropdownButtonFormField(
                              isExpanded: true,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0.5,
                                    color: Color(0xff232323),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0.5,
                                    color: Colors.red,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0.5,
                                    color: Colors.green,
                                  ),
                                ),
                                filled: true,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0,
                                    horizontal:
                                        8.0), // Increase the vertical padding
                                fillColor: Colors.white,
                              ),
                              items: NigerianStatesAndLGA.allStates
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (val) {
                                lgaValue = 'Select a Local Government Area';
                                statesLga.clear();
                                statesLga.add(lgaValue);
                                statesLga.addAll(
                                    NigerianStatesAndLGA.getStateLGAs(val!));
                                setState(() {
                                  stateValue = val;
                                  mainWhsStateController.text = val;
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                        child: Text('LGA:'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: SizedBox(
                          width: 500,
                          child: DropdownButtonFormField(
                              isExpanded: true,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0.5,
                                    color: Color(0xff232323),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0.5,
                                    color: Colors.red,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0.5,
                                    color: Colors.green,
                                  ),
                                ),
                                filled: true,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0,
                                    horizontal:
                                        8.0), // Increase the vertical padding
                                fillColor: Colors.white,
                              ),
                              items: statesLga.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  lgaValue = val!;
                                  mainWhsLgaController.text = val;
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Other warehouse(s), please specify',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: addFormField,
                  icon: const Icon(Icons.add_circle_outline_outlined),
                  color: Colors.green,
                )
              ],
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: formData.length,
                itemBuilder: (context, index) {
                  return FormFieldWidget(
                    formData: formData[index],
                    onRemove: () => removeFormField(index),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "TDI INFORMATION",
                  style: TextStyle(
                      color: Color(0xff06BA63), fontWeight: FontWeight.w700),
                ),
                IconButton(
                  onPressed: addTdiField,
                  icon: const Icon(Icons.add_circle_outline_outlined),
                  color: Colors.green,
                )
              ],
            ),
            const SizedBox(height: 10),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: tdiData.length,
                itemBuilder: (context, index) {
                  return TdiInfoWidget(
                    tdiData: tdiData[index],
                    onRemove: () => removeTdiField(index),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    /*   if (_formKey.currentState!.validate()) {
                      setState(() {
                        CustomerLanguage customerLang = CustomerLanguage(
                            english: isEnglish,
                            yoruba: isYoruba,
                            hausa: isHausa,
                            igbo: isIgbo,
                            pidgin: isPidgin);
                        for (var item in formData) {
                          CustomerWarehouse custWhs = CustomerWarehouse(
                              isMainWarehouse: false,
                              address: item.address,
                              state: item.state,
                              lga: item.lga);
                          whsData.add(custWhs);
                        }
                        for (var items in tdiData) {
                          customer_info.CustomerTdi tdiInfos =
                              customer_info.CustomerTdi(
                            tdiCode: items.tdiCode!,
                            tdiName: items.tdiName!,
                            tdiAddress: items.tdiAddress!,
                          );
                          tdiInformationData.add(tdiInfos);
                        }
                        CustomerInfoModel createCustinfo = CustomerInfoModel(
                          uid: uuid,
                          firstName: ownersFirstNameController.text,
                          lastName: ownersLastNameController.text,
                          otherNames: ownersOtherNameController.text,
                          email: ownersEmailController.text,
                          phoneNumber: ownersPhoneNumbController.text,
                          businessName: busNameController.text,
                          businessAddress: busAddressController.text,
                          isOfficeAddress: officeChecked,
                          receiveAllNotifications: receiveNotifications,
                          registeredCompanyNumber: rcNumberController.text,
                          coperateAffairsCommission: cacNumberController.text,
                          taxIdentificationNumber: tinNumberController.text,
                          customerTdIs: tdiInformationData,
                          customerLanguage: customerLang,
                          customerWarehouses: whsData,
                        );
                        print(createCustinfo);
                        createCustomerInfo(createCustinfo);
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Fill empty fields'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    } */

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Fill empty fields'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(200, 50)),
                  ),
                  child: const Text('Submit'),
                )
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
