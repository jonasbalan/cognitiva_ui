import 'package:cognitiva_ui/components/dynamicForm.dart';
//import 'package:cognitiva_ui/providers/states/concursoOpenApiProvider.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import '../../../mocks/concursoOpenApiMedataMock.dart';

class ConcursoEditScreen extends StatefulWidget {
  const ConcursoEditScreen({super.key});

  @override
  State<ConcursoEditScreen> createState() => _ConcursoEditScreenState();
}

class _ConcursoEditScreenState extends State<ConcursoEditScreen> {
  Map<String, dynamic> formData = <String, dynamic>{};

  Widget getDynamicForm(BuildContext context) {
    // var concursoOpenApiMetada =
    //     Provider.of<ConcursoOpenApiProvider>(context, listen: false);
    String baseUrl = "https://localhost:62400";
    String path = "/api/Concurso";

    var concursoComponentSpec = getFormSpec(path, "post");
    return DynamicForm(
        url: Uri.parse('$baseUrl$path'), schema: concursoComponentSpec);
  }

  Map<String, dynamic>? getFormSpec(String path, String httpMethod) {
    var metadata = concursoOpenApiMetadataMock.getData();
    var pathInfo = metadata["paths"][path];
    String componentName = pathInfo[httpMethod]["requestBody"]["content"]
        ["application/json"]["schema"]["\$ref"];

    componentName = componentName.replaceAll("#/components/schemas/", "");

    var component = metadata["components"]["schemas"][componentName];

    return component as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return getDynamicForm(context);
    //return Scaffold(body: getDynamicForm());
  }
}
