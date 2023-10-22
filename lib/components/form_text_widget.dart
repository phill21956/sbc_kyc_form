import 'package:flutter/material.dart';
import 'package:sbc_kyc_form/model/get_cust_local_info.dart';
import 'package:sbc_kyc_form/pages/form_page.dart';
import 'package:http/http.dart' as http;

import '../model/add_data_consent_model.dart';
import '../services/shared_pref.dart';

class FormTextWidget extends StatefulWidget {
  FormTextWidget({
    super.key,
  });

  @override
  State<FormTextWidget> createState() => _FormTextWidgetState();
}

class _FormTextWidgetState extends State<FormTextWidget> {
  static final _formTextKey = GlobalKey<FormState>();

  final TextEditingController _textController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _signatureController = TextEditingController();

  final _dateController = TextEditingController();

  final TextEditingController _AddressController = TextEditingController();

  final TextEditingController _designationController = TextEditingController();
  late GetCustLocalInfoModel customerLocalInfo;
  final SharedPref _sharedPref = SharedPref();
  DateTime? dateAccepted;
  int versionNum = 1;
  String vendorName = 'Vendor Name';
  String ownerName = ' Enter your full name';
  String addressName = 'Enter your Address';
  String uuid = '';

  Future<void> addDataConsent(AddDataConsentModel addDataConsentModel) async {
    try {
      final String addDataConsent =
          addDataConsentModelToJson(addDataConsentModel);
      print(addDataConsent);
      String url =
          'https://androiddev.sevenup.org/cs/api/Customer/AddDataConsent';
      var response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json-patch+json',
            'accept': '*/*',
          },
          body: addDataConsent);
      print("${response.statusCode} : ${response.body}");
      //print(response.body);
      if (response.statusCode == 200) {
        final currentContext = context;
        setState(() {
          ScaffoldMessenger.of(currentContext).showSnackBar(
            const SnackBar(
              content: Text('Successful'),
              duration: Duration(seconds: 3),
            ),
          );
        });
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.push(
            currentContext,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  FormPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                final tween = Tween(begin: begin, end: end);
                final offsetAnimation = animation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 800),
            ),
          );
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
      print(customerLocalInfo);
      vendorName = customerLocalInfo.businessName;
      ownerName = customerLocalInfo.ownerName;
      addressName = customerLocalInfo.address;
      uuid = customerLocalInfo.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formTextKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PURPOSE OF THE FORM:',
            style: TextStyle(
                color: Color(0xff06BA63), fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 15),
          const Text(
            '''
      The purpose of this KYC Form is to collect relevant information and documentation from our valued customers in compliance with regulatory requirements. As part of our commitment to maintaining a secure and trustworthy business relationship, The KYC process enables us to verify the identity and update our customers information with the company’s records 
      
      Your cooperation in providing accurate and complete information is vital to ensure that we can fulfil our primary goal of satisfying you; our customers, while protecting the interests of both our customers and our organisation. 
      
      Please read the instructions carefully and provide all the requested information accurately. Failure to provide complete and accurate information may result in delays or complications in processing your request thus straining our business relationship.
      
      We assure you that all information provided will be treated with utmost confidentiality and in accordance with our privacy policies and applicable data protection regulations.
      
      Thank you for your unwavering cooperation and trust in our organisation.
      
      ''',
            style: TextStyle(wordSpacing: 5),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'CUSTOMER PERSONAL DATA CONSENT FORM (version 1.0.0)',
            style: TextStyle(
                color: Color(0xff06BA63), fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
              'To be able to update my personal information as a customer of Seven-Up Bottling Company Limited (“Seven-Up”), I'),
          Row(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: 500,
                        child: TextFormField(
                          validator: (value) {
                            if (_textController.text.isEmpty) {
                              _textController.text = ownerName;
                            }
                          },
                          controller: _textController,
                          decoration: InputDecoration(
                            hintText: ownerName,
                          ),
                          textAlign: TextAlign.center,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ),
                    // Flexible(
                    //   child: SizedBox(
                    //     width: 500,
                    //     child: TextField(
                    //       controller: _designationController,
                    //       decoration: const InputDecoration(
                    //         hintText: '  Enter your designation',
                    //       ),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '''
    as a representative of ${vendorName} understand that Seven-Up may collect, process, store and use my personal data for the performance of contract(s) signed by [Vendor’s name] with Seven-Up, and for other lawful purposes including but not limited to payment for services rendered etc. The data shall be accessed in line with Seven-Up’s Data Protection Policy and the Nigeria Data Protection Regulation, 2019 (NDPR). The data so collected shall be in respect of the following: Billing Notification, Payment, Authentication and Confirm Delivery.
           
      I am also aware that the personal data required by Seven-Up for the purposes mentioned herein may include my name, email address, office address, phone number, and other related data.
      
      I am aware that Seven-Up may share my personal data with its affiliates, agents, regulatory authorities or third-party service providers for the purposes for which it is collected or in compliance with provisions of applicable laws. I am also aware that Seven-Up will retain the personal data as long as necessary for the purpose for which it is collected.
      
      I am also aware that I have the rights to:
      
      a) request for and access personal data collected and stored by Seven-Up; 
    
      b) withdraw consent at any time;
    
      c) object to automated decision making;
    
      d) request rectification and modification of my data kept by Seven-Up; 
    
      e) request for deletion of data;
    
      f) be informed of and entitled to provide consent prior to the processing of data for purposes other than that for which the personal data were collected;
      
      g) request the movement of my data by Seven-Up to third parties; and
    
      h) request that Seven-Up restricts its processing of my information. 
      
      
      I also confirm that I have read and understood the Seven-Up Privacy Notice. 
      
      In consideration of all the information stated herein that are within my knowledge, I hereby consent to the collection, processing, use and transfer of my personal data, within or outside Nigeria, for the purposes stated herein.
       ''',
            style: TextStyle(wordSpacing: 5),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Text('Name: '),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: SizedBox(
                    width: 500,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 8.0), // Increase the vertical padding
                        fillColor: Color(0xffF7F7F7),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please fill this field';
                        }
                        return null;
                      },
                      controller: _nameController,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('Signature: '),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: SizedBox(
                    width: 500,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 8.0), // Increase the vertical padding
                        fillColor: Color(0xffF7F7F7),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please fill this field';
                        }
                        return null;
                      },
                      controller: _signatureController,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('Date: '),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: SizedBox(
                    width: 500,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 8.0,
                        ),
                        fillColor: Color(0xffF7F7F7),
                      ),
                      keyboardType: TextInputType.datetime,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please fill this field';
                        }
                        // Additional validation for datetime format if needed
                        // You can use a regular expression or a custom validation logic
                        return null;
                      },
                      controller: _dateController,
                      onTap: () async {
                        // Show date picker when the field is tapped
                        FocusScope.of(context).requestFocus(FocusNode());
                        final DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: _dateController.text.isNotEmpty
                              ? DateTime.parse(_dateController.text)
                              : DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (selectedDate != null) {
                          setState(() {
                            dateAccepted = selectedDate;
                            _dateController.text = selectedDate.toString();
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('Address: '),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: SizedBox(
                    width: 500,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 8.0), // Increase the vertical padding
                        fillColor: Color(0xffF7F7F7),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please fill this field';
                        }
                        return null;
                      },
                      controller: _AddressController,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  /*    if (_formTextKey.currentState!.validate()) {
                    setState(() {
                      AddDataConsentModel addDataConsentMod =
                          AddDataConsentModel(
                              uid: uuid,
                              undertakingName: _textController.text,
                              name: _nameController.text,
                              signature: _signatureController.text,
                              dateAccepted: dateAccepted!,
                              address: _AddressController.text,
                              version: versionNum);
                      addDataConsent(addDataConsentMod);
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill empty fields'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  } */
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FormPage()));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xff1A9B27)),
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(200, 50)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(' Fill personal information'),
                    Icon(Icons.arrow_circle_right_outlined)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
