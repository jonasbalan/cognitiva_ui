import 'package:cognitiva_ui/components/dynamicForms/dynamicForm.dart';
import 'package:cognitiva_ui/providers/states/openApiSpecsProvider.dart';
// import 'package:cognitiva_ui/services/dynamicMetadataReader.dart';
//import 'package:cognitiva_ui/providers/states/concursoOpenApiProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';
// import '../../../mocks/concursoOpenApiMedataMock.dart';

class ConcursoEditScreen extends StatefulWidget {
  const ConcursoEditScreen({super.key});

  @override
  State<ConcursoEditScreen> createState() => _ConcursoEditScreenState();
}

class _ConcursoEditScreenState extends State<ConcursoEditScreen> {
  Map<String, dynamic> formData = <String, dynamic>{};

  Widget getDynamicForm(BuildContext context) {
    var concursoOpenApiMetada =
        Provider.of<OpenApiSpecsProvider>(context, listen: false);
    String baseUrl = "https://localhost:62400";
    String path = "/api/Concurso";

    //var concursoComponentSpec = DynamicMetadaReader().getFormSpec(path, "post");
    return DynamicForm(
        url: Uri.parse('$baseUrl$path'),
        schema: concursoOpenApiMetada.getFormSpec(path, "post"));
  }

  @override
  Widget build(BuildContext context) {
    return getDynamicForm(context);
    //return Scaffold(body: getDynamicForm());
  }
}
