import 'package:cognitiva_ui/components/dynamicForm.dart';
import 'package:cognitiva_ui/components/dynamicFormFields/dynamicEnumDropDownField.dart';
import 'package:cognitiva_ui/components/dynamicFormFields/dynamicFormFieldBase.dart';
import 'package:flutter/material.dart';

class DynamicRefObjectFormField extends DynamicFormFieldBase {
  const DynamicRefObjectFormField(
      {super.key,
      required super.fieldKey,
      required super.fieldSchema,
      required super.onSaved,
      super.currentValue});

  @override
  Widget build(BuildContext context) {
    return getRefFormField();
  }

  Widget getRefFormField() {
    Map<String, dynamic> component = getRefComponentSchema();
    if (component.containsKey("enum")) {
      return DynamicEnumDropDownField(
          key: super.key,
          fieldKey: super.fieldKey,
          fieldSchema: component,
          onSaved: super.onSaved,
          currentValue: super.currentValue);
    } else {
      //return component as Map<String, dynamic>;
      return Container(
          child: DynamicForm(
        url: Uri.parse(""),
        schema: component,
      ));
    }
  }
}
