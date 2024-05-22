import 'package:cognitiva_ui/components/dynamicFormFields/dynamicFormField.dart';
import 'package:cognitiva_ui/insfrastructure/helpers/jsonHelper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DynamicForm extends StatefulWidget {
  final Uri url;
  final Map<String, dynamic>? schema;
  final Map<String, dynamic>? formData;

  const DynamicForm(
      {super.key, required this.url, required this.schema, this.formData});

  @override
  _DynamicFormState createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      final body = JsonDynamicSerializer.jsonDynamicEncode(_formData);
      final response = await http.post(
        widget.url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        print('Success');
      } else {
        print('Failed to submit form');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.schema == null) {
      return const AlertDialog(
        icon: Icon(Icons.error),
        title: Text("Error"),
        content: Text("Falha ao carregar os metadados do OpenApi!"),
      );
    } else {
      return Form(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ListTile(
                            title:
                                Text(widget.schema?["title"].toString() ?? ""),
                            //tileColor: Colors.red,
                            leading: const Icon(Icons.home_work_outlined),

                            titleAlignment: ListTileTitleAlignment.center,
                          ),
                          const Divider(),
                          ...widget.schema?['properties'].entries
                              .map<Widget>((entry) {
                            return DynamicFormField(
                                key: ValueKey('${entry.key}_key'),
                                fieldKey: entry.key,
                                fieldSchema:
                                    entry.value as Map<String, dynamic>,
                                onSaved: (newValue) => {
                                      setState(() {
                                        _formData[entry.key] = newValue;
                                      })
                                    },
                                currentValue: _formData[entry.key]);
                          }).toList()
                            ..add(const Divider())
                            ..add(Container(
                              margin: const EdgeInsets.only(top: 15.0),
                              child: ElevatedButton(
                                onPressed: _submitForm,
                                child: const Text('Submit'),
                              ),
                            ))
                        ],
                      ))))));
    }
  }
}
