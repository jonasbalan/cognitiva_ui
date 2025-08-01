import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'dart:developer' as developer;

class DynamicDataGrid extends StatefulWidget {
  final Uri url;
  final Map<String, dynamic>? schema;
  final List<Map<String, dynamic>>? listData;
  final Widget? editCreate;

  const DynamicDataGrid(
      {super.key,
      required this.url,
      this.schema,
      this.listData,
      this.editCreate});

  @override
  State<DynamicDataGrid> createState() => _DynamicDataGridState();
}

class _DynamicDataGridState extends State<DynamicDataGrid> {
  late final PlutoGridStateManager stateManager;

  List<PlutoColumn> getColumns() {
    List<PlutoColumn> result = [];
    Map<String, dynamic>? propertities = widget?.schema?["properties"];
    propertities?.forEach((key, value) {
      if (!(value as Map<String, dynamic>).containsKey("\$ref")) {
        var column = PlutoColumn(
            title: value["title"] as String,
            field: key,
            type: PlutoColumnType.text(),
            textAlign: PlutoColumnTextAlign.start,
            titleTextAlign: PlutoColumnTextAlign.end);
        result.add(column);
      }
    });

    return result;
  }

  List<PlutoRow> getRowns() {
    return List.empty(growable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        textDirection: TextDirection.ltr,
        children: [
          Container(
              padding: const EdgeInsets.all(15),
              constraints: const BoxConstraints(maxHeight: 200),
              child: PlutoGrid(
                columns: getColumns(),
                rows: getRowns(),
                // //columnGroups: columnGroups,
                onLoaded: (PlutoGridOnLoadedEvent event) {
                  stateManager = event.stateManager;
                  stateManager.setShowColumnFilter(true);
                },
                onChanged: (PlutoGridOnChangedEvent event) {
                  //print(event);
                  developer.log(event.value);
                },
                configuration: const PlutoGridConfiguration(),
              )),
          FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => widget.editCreate!),
              );
            },
            child: const Icon(Icons.add),
          ),
        ]);
  }
}
