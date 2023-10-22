import 'package:flutter/material.dart';
import 'package:sbc_kyc_form/model/notification_form_model.dart';

class NotificationFormWidget extends StatefulWidget {
  final NotificationFieldData notificationFieldData;
  final VoidCallback onRemove;
  NotificationFormWidget(
      {super.key, required this.notificationFieldData, required this.onRemove});

  @override
  State<NotificationFormWidget> createState() => _NotificationFormWidgetState();
}

class _NotificationFormWidgetState extends State<NotificationFormWidget> {
  bool billingOption = false;
  bool paymentOption = false;
  bool confirmOption = false;
  bool isEnglish = false;
  bool isYoruba = false;
  bool isHausa = false;
  bool isIgbo = false;
  bool isPidgin = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 2,
          child: Table(
            border: TableBorder.all(color: Colors.green),
            children: [
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    onChanged: (value) =>
                        widget.notificationFieldData.name = value,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    onChanged: (value) =>
                        widget.notificationFieldData.phoneNumber = value,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    onChanged: (value) =>
                        widget.notificationFieldData.email = value,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Checkbox(
                              value: billingOption,
                              onChanged: (value) {
                                setState(() {
                                  billingOption = value!;
                                  widget.notificationFieldData.billing = value;
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
                          ),
                          const Flexible(child: Text('Billing notifications')),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Checkbox(
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Colors.green;
                                }
                                return Colors.green;
                              }),
                              value: paymentOption,
                              onChanged: (value) {
                                setState(() {
                                  paymentOption = value!;
                                  widget.notificationFieldData
                                      .paymentAuthentication = value;
                                });
                              },
                            ),
                          ),
                          const Flexible(child: Text('Payment Authentication')),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Checkbox(
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Colors.green;
                                }
                                return Colors.green;
                              }),
                              value: confirmOption,
                              onChanged: (value) {
                                setState(() {
                                  confirmOption = value!;
                                  widget.notificationFieldData.confirmDelivery =
                                      value;
                                });
                              },
                            ),
                          ),
                          const Flexible(child: Text('Confirm Delivery')),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Checkbox(
                              value: isEnglish,
                              onChanged: (value) {
                                setState(() {
                                  isEnglish = value!;
                                  widget.notificationFieldData.isEnglish =
                                      value;
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
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Colors.green;
                                }
                                return Colors.green;
                              }),
                              value: isYoruba,
                              onChanged: (value) {
                                setState(() {
                                  isYoruba = value!;
                                  widget.notificationFieldData.isYoruba = value;
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
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Colors.green;
                                }
                                return Colors.green;
                              }),
                              value: isIgbo,
                              onChanged: (value) {
                                setState(() {
                                  isIgbo = value!;
                                  widget.notificationFieldData.isIgbo = value;
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
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Colors.green;
                                }
                                return Colors.green;
                              }),
                              value: isHausa,
                              onChanged: (value) {
                                setState(() {
                                  isHausa = value!;
                                  widget.notificationFieldData.isHausa = value;
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
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Colors.green;
                                }
                                return Colors.green;
                              }),
                              value: isPidgin,
                              onChanged: (value) {
                                setState(() {
                                  isPidgin = value!;
                                  widget.notificationFieldData.isPidgin = value;
                                });
                              },
                            ),
                          ),
                          const Flexible(child: Text('Pidgin')),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
        IconButton(
          onPressed: widget.onRemove,
          icon: const Icon(Icons.delete),
          color: Colors.red,
        ),
      ],
    );
  }
}
