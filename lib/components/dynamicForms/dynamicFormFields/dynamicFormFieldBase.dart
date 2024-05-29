import 'package:flutter/material.dart';
import '../../../../../mocks/concursoOpenApiMedataMock.dart';

class DynamicFormFieldBase extends StatelessWidget {
  final String fieldKey;
  final Map<String, dynamic> fieldSchema;
  final void Function(dynamic newValue) onSaved;
  final dynamic currentValue;

  const DynamicFormFieldBase(
      {super.key,
      required this.fieldKey,
      required this.fieldSchema,
      required this.onSaved,
      this.currentValue});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  ValueKey<String> CreateInputFieldKey() => ValueKey('${key}_input_key');

  Widget getLabelText() {
    String label = fieldSchema["title"] ?? fieldKey;
    if (isRequiredField()) {
      return Row(children: [
        Text(label),
        const Text(" *",
            style: TextStyle(
              color: Colors.red,
            ))
      ]);
    }
    return Text(label);
  }

  String getLableTextString() {
    String label = fieldSchema["title"] ?? fieldKey;
    if (isRequiredField()) {
      return "$label *";
    }
    return label;
  }

  String getHintText() {
    return fieldSchema["example"] ?? "";
  }

  bool isRequiredField() {
    bool hasNullableKey = fieldSchema.containsKey("nullable");
    if ((!hasNullableKey) ||
        (hasNullableKey && fieldSchema["nullable"] == false)) return true;
    return false;
  }

  Map<String, dynamic> getRefComponentSchema() {
    var metadata = concursoOpenApiMetadataMock.getData();

    String componentName =
        fieldSchema["\$ref"].replaceAll("#/components/schemas/", "");

    var component = metadata["components"]["schemas"][componentName]
        as Map<String, dynamic>;

    return component;
  }
}
