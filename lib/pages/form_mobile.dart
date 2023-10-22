import 'package:flutter/material.dart';
import 'package:sbc_kyc_form/components/other_whs_widget.dart';
import 'package:sbc_kyc_form/components/tdi_info_widget.dart';
import 'package:sbc_kyc_form/model/form_field_model.dart';
import 'package:sbc_kyc_form/model/tdi_field_model.dart';

class FormMobileWidget extends StatefulWidget {
  FormMobileWidget({
    super.key,
  });

  @override
  State<FormMobileWidget> createState() => _FormMobileWidgetState();
}

class _FormMobileWidgetState extends State<FormMobileWidget> {
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
  bool notificationVisible = false;
  int notificationOption = 0;
  int languageOption = 0;
  List<FormFieldData> formData = [];
  List<TdiFieldData> tdiData = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Add an initial form field
    addFormField();
    addTdiField();
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
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                            text: 'accurately\nas possible duh.',
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
            Column(
              //   mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
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
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0.5,
                                color: Color(0xff232323),
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
                          controller: navCodeController,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                      child: Text('SAP Code:'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
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
                          controller: sapCodeController,
                        ),
                      ),
                    ),
                  ],
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
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
                          controller: ownersFirstNameController,
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text('Last Name:'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                      child: Text('Others (optional):'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
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
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
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
                            // hintText: "Enter Name",
                            fillColor: Colors.white,
                          ),
                          controller: ownersPhoneNumbController,
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                      child: Text('Others (optional):'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
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
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
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
                          controller: ownersEmailController,
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
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "BUSINESS INFORMATION",
              style: TextStyle(
                  color: Color(0xff06BA63), fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
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
                          controller: busNameController,
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
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
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
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                value: homeChecked,
                                onChanged: (value) {
                                  setState(() {
                                    homeChecked = value!;
                                  });
                                },
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Colors.green;
                                  }
                                  return Colors.green;
                                }),
                              ),
                              const Text('Warehouse'),
                              const SizedBox(width: 10),
                              Checkbox(
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Colors.green;
                                  }
                                  return Colors.green;
                                }),
                                value: officeChecked,
                                onChanged: (value) {
                                  setState(() {
                                    officeChecked = value!;
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
                          controller: busAddressController,
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
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
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
                          controller: busPhoneNumbController,
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
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
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      text: 'Would you like to receive ',
                      style: DefaultTextStyle.of(context).style,
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'billing notifications',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: ',  ',
                        ),
                        TextSpan(
                          text: 'confirm load delivery',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: ', and  ',
                        ),
                        TextSpan(
                          text: 'payment authentication notifications ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: ' to the number provided above.',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: notificationOption == 1,
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              notificationOption = 1;
                              notificationVisible = false;
                            } else {
                              notificationOption = 0;
                              notificationVisible = false;
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
                      const Text('Yes'),
                      const SizedBox(width: 16),
                      Checkbox(
                        fillColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors.green;
                          }
                          return Colors.green;
                        }),
                        value: notificationOption == 2,
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              notificationOption = 2;
                              notificationVisible = true;
                            } else {
                              notificationOption = 0;
                              notificationVisible = false;
                            }
                          });
                        },
                      ),
                      const Text('No'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: notificationVisible,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                //  mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                      'If no, please provide another name, mobile number, and email '),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Billing Notifications',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
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
                              child: Text('Name:'),
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
                                  controller: billingNotifNameController,
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
                              child: Text('Phone Number:'),
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
                                  controller: billingNotifNumbController,
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
                              child: Text('Email:'),
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
                                  controller: billingNotifEmailController,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Payment Authentication',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
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
                              child: Text('Name:'),
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
                                  controller: paymentAuthNameController,
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
                              child: Text('Phone Number:'),
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
                                  controller: paymentAuthNumbController,
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
                              child: Text('Email:'),
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
                                  controller: paymentAuthEmailController,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Confirm Delivery',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
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
                              child: Text('Name:'),
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
                                  controller: confirmDeliveryNameController,
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
                              child: Text('Phone Number:'),
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
                                  controller: confirmDeliveryNumbController,
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
                              child: Text('Email:'),
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
                                  controller: confirmDeliveryEmailController,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
                'Please indicate your preferred language for communication and SMS notifications from the options below.'),
            Row(
              mainAxisSize: MainAxisSize.min,
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
                            } else {
                              languageOption = 0;
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
                            } else {
                              languageOption = 0;
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
                            } else {
                              languageOption = 0;
                            }
                          });
                        },
                      ),
                    ),
                    const Flexible(child: Text('Igbo')),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                            } else {
                              languageOption = 0;
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
                            } else {
                              languageOption = 0;
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
                            maxLines: 2,
                            controller: mainWhsStateController,
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
                        child: Text('LGA:'),
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
                            maxLines: 2,
                            controller: mainWhsLgaController,
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
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Successful'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Fill empty fields'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  },
                  child: const Text('Submit'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(200, 50)),
                  ),
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
