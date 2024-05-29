import 'package:cognitiva_ui/components/dynamicForms/dynamicFormFields/dynamicFormFieldBase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DynamicNumberFormField extends DynamicFormFieldBase {
  const DynamicNumberFormField(
      {super.key,
      required super.fieldKey,
      required super.fieldSchema,
      required super.onSaved,
      super.currentValue});

  @override
  Widget build(BuildContext context) {
    return getNumbeTextFormField();
  }

  Widget getNumbeTextFormField() {
    return TextFormField(
      onSaved: onSaved,
      decoration: InputDecoration(
        // labelText: getLableText(fieldKey),
        label: getLabelText(),
        hintText: getHintText(),
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ], // Only numbers can be entered
    );
  }
}
