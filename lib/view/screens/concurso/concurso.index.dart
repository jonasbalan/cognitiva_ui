import 'package:cognitiva_ui/components/dynamicList/dynamicDataGrid.dart';
import 'package:cognitiva_ui/components/layout/basicScaffoldScreen.dart';
import 'package:cognitiva_ui/mocks/concursoDataMock.dart';
import 'package:cognitiva_ui/providers/states/openApiSpecsProvider.dart';
import 'package:cognitiva_ui/view/screens/concurso/concurso.edit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConcursoListScreen extends StatelessWidget {
  const ConcursoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String baseUrl = "https://localhost:62400";
    String path = "/api/Concurso/paged";

    final Future<List<Map<String, dynamic>>> getData =
        Future<List<Map<String, dynamic>>>.delayed(
      const Duration(seconds: 2),
      () => ConcursoDataMock.getData(),
    );

    var concursoOpenApiMetada =
        Provider.of<OpenApiSpecsProvider>(context, listen: false);

    return FutureBuilder<List<Map<String, dynamic>>>(
        future: getData,
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return DynamicDataGrid(
              url: Uri.parse('$baseUrl$path'),
              schema: concursoOpenApiMetada.getListSpec(path),
              listData: snapshot.data,
              editCreate:
                  const BasicScaffoldScreen(child: ConcursoEditScreen()),
            );
          }
        });
  }
}
