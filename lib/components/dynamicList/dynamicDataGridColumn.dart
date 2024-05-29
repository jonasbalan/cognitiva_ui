import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class DynamicDataGridColumn {
  final String fieldKey;
  final Map<String, dynamic> fieldSchema;
  final dynamic currentValue;

  DynamicDataGridColumn(
      {required this.fieldKey, required this.fieldSchema, this.currentValue});

  PlutoColumnType getColumnType() {
    return PlutoColumnType.text();
  }

  String getColumnFieldName() {
    return fieldKey;
  }

  String getColumnTitle() {
    return fieldSchema["title"];
  }

  PlutoColumn create() {
    PlutoColumn result = PlutoColumn(
        title: getColumnTitle(),
        field: getColumnFieldName(),
        type: getColumnType());

    return result;
  }
}
