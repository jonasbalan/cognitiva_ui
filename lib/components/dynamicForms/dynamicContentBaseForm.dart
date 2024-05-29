import 'package:cognitiva_ui/components/dynamicForms/dynamicFormFields/dynamicFormField.dart';
import 'package:flutter/material.dart';

class DynamicContentBaseForm extends StatelessWidget {
  final Map<String, dynamic> schema;
  final Map<String, dynamic> formData;
  final void Function(String key, dynamic newValue) onSaved;
  final void Function() onSubmit;
  const DynamicContentBaseForm(
      {super.key,
      required this.schema,
      required this.formData,
      required this.onSaved,
      required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      title: Text(schema["title"].toString() ?? ""),
                      //tileColor: Colors.red,
                      leading: const Icon(Icons.home_work_outlined),

                      titleAlignment: ListTileTitleAlignment.center,
                    ),
                    const Divider(),
                    ...schema['properties'].entries.map<Widget>((entry) {
                      return DynamicFormField(
                          key: ValueKey('${entry.key}_key'),
                          fieldKey: entry.key,
                          fieldSchema: entry.value as Map<String, dynamic>,
                          onSaved: (newValue) => onSaved(entry.key, newValue),
                          currentValue: formData[entry.key]);
                    })
                  ],
                )))));
  }
}
