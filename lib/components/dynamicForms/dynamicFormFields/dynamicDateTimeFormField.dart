import 'package:cognitiva_ui/components/dynamicForms/dynamicFormFields/dynamicFormFieldBase.dart';
import 'package:flutter/material.dart';

class DynamicDatetimeFormField extends DynamicFormFieldBase {
  const DynamicDatetimeFormField(
      {super.key,
      required super.fieldKey,
      required super.fieldSchema,
      required super.onSaved,
      super.currentValue});

  @override
  Widget build(BuildContext context) {
    return getDateTextFormField(context);
  }

  Widget getDateTextFormField(BuildContext context) {
    final firstDate = DateTime(DateTime.now().year - 120);
    final finalDate = DateTime(DateTime.now().year + 120);
    final initialDate = currentValue != null
        ? (DateTime.tryParse(currentValue))
        : DateTime.now();

    selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          firstDate: firstDate,
          lastDate: finalDate,
          initialEntryMode: DatePickerEntryMode.input,
          initialDate: initialDate);
      if (picked != null && picked != currentValue) {
        onSaved(picked.toIso8601String());
      }
    }

    return TextFormField(
      key: CreateInputFieldKey(),
      initialValue: initialDate.toString(),
      onSaved: onSaved,
      decoration: InputDecoration(
        // labelText: getLableText(fieldKey),
        label: getLabelText(),
        hintText: getHintText(),
        border: const OutlineInputBorder(),
        // suffix: IconButton(
        //   icon: const Icon(Icons.arrow_drop_down),
        //   onPressed: () => _selectDate(context),
        // ),
      ),
      keyboardType: TextInputType.datetime,
      onTap: () => selectDate(context),
    );

    // return GestureDetector(
    //     onTap: () {
    //       showDatePicker(
    //         context: context,
    //         firstDate: firstDate,
    //         lastDate: finalDate,
    //         initialEntryMode: DatePickerEntryMode.input,
    //       );
    //     },
    //     child: InputDatePickerFormField(
    //       firstDate: firstDate,
    //       lastDate: finalDate,
    //       initialDate: initialDate,
    //       fieldLabelText: getLableTextString(),
    //       fieldHintText: getHintText(),
    //       onDateSaved: (value) => onSaved(value.toIso8601String()),
    //       keyboardType: TextInputType.datetime,
    //     ));
  }
}
