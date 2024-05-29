import 'package:cognitiva_ui/components/dynamicForms/dynamicFormFields/dynamicBooleanFormField.dart';
import 'package:cognitiva_ui/components/dynamicForms/dynamicFormFields/dynamicDateTimeFormField.dart';
import 'package:cognitiva_ui/components/dynamicForms/dynamicFormFields/dynamicNumberField.dart';
import 'package:cognitiva_ui/components/dynamicForms/dynamicFormFields/dynamicRefObjectField.dart';
import 'package:cognitiva_ui/components/dynamicForms/dynamicFormFields/dynamicTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DynamicFormField extends StatelessWidget {
  final String fieldKey;
  final Map<String, dynamic> fieldSchema;
  final void Function(dynamic newValue) onSaved;
  final dynamic currentValue;

  const DynamicFormField(
      {super.key,
      required this.fieldKey,
      required this.fieldSchema,
      required this.onSaved,
      this.currentValue});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: dynamicFieldFactory(context));
  }

  Widget dynamicFieldFactory(BuildContext context) {
    if (fieldSchema.containsKey("type")) {
      switch (fieldSchema['type']) {
        case 'string':
          if (fieldSchema['format'] == 'date-time') {
            return DynamicDatetimeFormField(
                key: key,
                fieldKey: fieldKey,
                fieldSchema: fieldSchema,
                onSaved: onSaved,
                currentValue: currentValue);
          } else {
            return DynamicTextFormField(
                key: key,
                fieldKey: fieldKey,
                fieldSchema: fieldSchema,
                onSaved: onSaved,
                currentValue: currentValue);
          }
        case 'boolean':
          return DynamicBooleanFormField(
              key: key,
              fieldKey: fieldKey,
              fieldSchema: fieldSchema,
              onSaved: onSaved,
              currentValue: currentValue);

        // Add more cases for other types of fields
        case 'integer':
          return DynamicNumberFormField(
              key: key,
              fieldKey: fieldKey,
              fieldSchema: fieldSchema,
              onSaved: onSaved,
              currentValue: currentValue);
        default:
          return const SizedBox.shrink();
      }
    } else if (fieldSchema.containsKey("\$ref")) {
      return DynamicRefObjectFormField(
          key: key,
          fieldKey: fieldKey,
          fieldSchema: fieldSchema,
          onSaved: onSaved,
          currentValue: currentValue);
      //const SizedBox.shrink(); // getRefFormField();
    } else {
      return const SizedBox.shrink();
    }
  }
}
