import 'package:cognitiva_ui/components/dynamicFormFields/dynamicFormFieldBase.dart';
import 'package:flutter/material.dart';

class DynamicEnumDropDownField extends DynamicFormFieldBase {
  const DynamicEnumDropDownField(
      {super.key,
      required super.fieldKey,
      required super.fieldSchema,
      required super.onSaved,
      super.currentValue});

  @override
  Widget build(BuildContext context) {
    return getEnumDropDown(fieldSchema["enum"]);
  }

  Widget getEnumDropDown(List<String> itens) {
    if (itens.isNotEmpty) {
      var menuItens = itens
          .map<DropdownMenuItem<String>>(
              (x) => DropdownMenuItem<String>(value: x, child: Text(x)))
          .toList();
      return DropdownButtonFormField<String>(
        key: CreateInputFieldKey(),
        items: menuItens,
        onChanged: (s) => {},
        decoration: InputDecoration(
            border: const OutlineInputBorder(), hintText: itens.first),
      );
    }
    return const Text("Erro ao carregar Enum");
  }
}
