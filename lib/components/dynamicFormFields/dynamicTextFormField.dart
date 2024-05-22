import 'package:cognitiva_ui/components/dynamicFormFields/dynamicFormFieldBase.dart';
import 'package:flutter/material.dart';

class DynamicTextFormField extends DynamicFormFieldBase {
  const DynamicTextFormField(
      {super.key,
      required super.fieldKey,
      required super.fieldSchema,
      required super.onSaved,
      super.currentValue});

  @override
  Widget build(BuildContext context) {
    return getTextFormField();
  }

  Widget getTextFormField() {
    return TextFormField(
      key: CreateInputFieldKey(),
      onSaved: onSaved,
      decoration: InputDecoration(
        // labelText: getLableText(fieldKey),
        label: getLabelText(),
        hintText: getHintText(),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
