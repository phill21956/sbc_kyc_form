import 'package:flutter/material.dart';

import '../model/tdi_field_model.dart';

class TdiInfoWidget extends StatefulWidget {
  final TdiFieldData tdiData;
  final VoidCallback onRemove;

  TdiInfoWidget({required this.tdiData, required this.onRemove});

  @override
  _TdiInfoWidgetState createState() => _TdiInfoWidgetState();
}

class _TdiInfoWidgetState extends State<TdiInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
                child: Text('TDI Code:'),
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
                          horizontal: 8.0), // Increase the vertical padding
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) => widget.tdiData.tdiCode = value,

                    //controller: tdiCodeController,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                child: Text('TDI Name:'),
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
                          horizontal: 8.0), // Increase the vertical padding
                      // hintStyle: TextStyle(color: Colors.grey),
                      // hintText: "Enter Name",
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) => widget.tdiData.tdiName = value,

                    // controller: tdiNameController,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
                child: Text('TDI Address:'),
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
                          horizontal: 8.0), // Increase the vertical padding
                      fillColor: Colors.white,
                    ),
                    maxLines: 3,
                    onChanged: (value) => widget.tdiData.tdiAddress = value,

                    // controller: tdiAddressController,
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: widget.onRemove,
          icon: Icon(Icons.delete),
          color: Colors.red,
        ),
      ],
    );
  }
}
