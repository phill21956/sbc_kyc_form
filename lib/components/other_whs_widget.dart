import 'package:flutter/material.dart';

import '../model/form_field_model.dart';

class DynamicFormScreen extends StatefulWidget {
  @override
  _DynamicFormScreenState createState() => _DynamicFormScreenState();
}

class _DynamicFormScreenState extends State<DynamicFormScreen> {
  List<FormFieldData> formData = [];

  @override
  void initState() {
    super.initState();
    // Add an initial form field
    addFormField();
  }

  void addFormField() {
    setState(() {
      formData.add(FormFieldData());
    });
  }

  void removeFormField(int index) {
    setState(() {
      formData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Form'),
      ),
      body: ListView.builder(
        itemCount: formData.length,
        itemBuilder: (context, index) {
          return FormFieldWidget(
            formData: formData[index],
            onRemove: () => removeFormField(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addFormField,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class FormFieldWidget extends StatefulWidget {
  final FormFieldData formData;
  final VoidCallback onRemove;

  FormFieldWidget({required this.formData, required this.onRemove});

  @override
  _FormFieldWidgetState createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 3,
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
                  //  width: 500,
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
                          horizontal: 8.0), // Increase the vertical padding
                      fillColor: Colors.white,
                    ),
                    maxLines: 3,
                    onChanged: (value) => widget.formData.address = value,
                    // controller: otherWhsAddressController,
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
                  //  width: 500,
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
                    maxLines: 2,
                    onChanged: (value) => widget.formData.state = value,
                    // controller: otherWhsStateController,
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
                  //  width: 500,
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
                    maxLines: 2,
                    onChanged: (value) => widget.formData.lga = value,
                    // controller: otherWhsLgaController,
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
