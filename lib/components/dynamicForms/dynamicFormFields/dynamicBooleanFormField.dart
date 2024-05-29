import 'package:cognitiva_ui/components/dynamicForms/dynamicFormFields/dynamicFormFieldBase.dart';
import 'package:flutter/material.dart';

class DynamicBooleanFormField extends DynamicFormFieldBase {
  const DynamicBooleanFormField(
      {super.key,
      required super.fieldKey,
      required super.fieldSchema,
      required super.onSaved,
      super.currentValue});

  @override
  Widget build(BuildContext context) {
    return getCheckBoxFormField();
  }

  Widget getCheckBoxFormField() {
    return CheckboxListTile(
      key: CreateInputFieldKey(),
      controlAffinity: ListTileControlAffinity.leading,
      title: getLabelText(),
      value: currentValue ?? false,
      shape: const OutlineInputBorder(),
      onChanged: (value) => {onSaved(value)},
    );
  }
}
