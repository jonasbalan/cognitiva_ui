import 'package:cognitiva_ui/components/dynamicContentBaseForm.dart';
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
  _DynamicFormState createState() => _DynamicFormState(formData);
}

class _DynamicFormState extends State<DynamicForm> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> _formData = {};

  _DynamicFormState(Map<String, dynamic>? formData) {
    _formData = formData ?? {};
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      var snackMsg = ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Processing Data')));

      _formKey.currentState?.save();

      final body = JsonDynamicSerializer.jsonDynamicEncode(_formData);
      final response = await http.post(
        widget.url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );

      snackMsg.close();
      String msgResul = "";
      if (response.statusCode == 200) {
        msgResul = "Sucesso";
        print('Success');
      } else {
        msgResul = "Falha ao enviar requisição";
        print('Failed to submit form');
      }

      var snackMsg1 = ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(msgResul)));
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
          child: Flexible(
              child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1024),
                  child: Container(
                      constraints: const BoxConstraints(maxWidth: 1024),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        DynamicContentBaseForm(
                          key: ValueKey(
                              '${widget.schema!["title"].toString().trim()}_formContentKey'),
                          schema: widget.schema!,
                          formData: _formData,
                          onSaved: (fieldKey, newValue) => {
                            setState(() {
                              _formData[fieldKey] = newValue;
                            })
                          },
                          onSubmit: _submitForm,
                        ),
                        const Divider(),
                        Container(
                          margin: const EdgeInsets.only(top: 15.0, bottom: 10),
                          child: ElevatedButton(
                            onPressed: _submitForm,
                            child: const Text('Salvar'),
                          ),
                        )
                      ])))));
    }
  }
}
