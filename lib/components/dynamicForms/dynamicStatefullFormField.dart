import 'package:cognitiva_ui/components/dynamicForms/dynamicContentBaseForm.dart';
import 'package:flutter/material.dart';

class DynamicStatefulFormField extends StatefulWidget {
  final Map<String, dynamic>? schema;
  final Map<String, dynamic>? formData;
  final void Function(dynamic newValue) onSaved;
  const DynamicStatefulFormField(
      {super.key, required this.schema, this.formData, required this.onSaved});

  @override
  State<DynamicStatefulFormField> createState() =>
      _DynamicStatefulFormFieldState(formData);
}

class _DynamicStatefulFormFieldState extends State<DynamicStatefulFormField> {
  Map<String, dynamic> _formData = {};

  _DynamicStatefulFormFieldState(Map<String, dynamic>? formData) {
    _formData = formData ?? {};
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: DynamicContentBaseForm(
            key: ValueKey(
                '${widget.schema!["title"].toString().trim()}_formSubContentKey'),
            schema: widget.schema!,
            formData: _formData,
            onSaved: (fieldKey, newValue) => {
                  setState(() {
                    _formData[fieldKey] = newValue;
                    widget.onSaved(_formData);
                  })
                },
            onSubmit: () => {}));
  }
}
