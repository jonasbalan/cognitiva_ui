import '../../../mocks/concursoOpenApiMedataMock.dart';

class DynamicMetadaReader {
  Map<String, dynamic>? getFormSpec(String path, String httpMethod) {
    var metadata = concursoOpenApiMetadataMock.getData();
    var pathInfo = metadata["paths"][path];
    String componentName = pathInfo[httpMethod]["requestBody"]["content"]
        ["application/json"]["schema"]["\$ref"];

    componentName = componentName.replaceAll("#/components/schemas/", "");

    var component = metadata["components"]["schemas"][componentName];

    return component as Map<String, dynamic>;
  }

  Map<String, dynamic>? getListSpec(String path) {
    String httpMethod = "get";
    var metadata = concursoOpenApiMetadataMock.getData();
    var pathInfo = metadata["paths"][path];
    Map<String, dynamic> responseSchema = pathInfo[httpMethod]["responses"]
        ["200"]["content"]["application/json"]["schema"];

    String componentName = "";
    if (responseSchema.keys.contains("items")) {
      componentName = responseSchema["items"]["\$ref"];
    } else {
      componentName = responseSchema["\$ref"];
    }

    componentName = componentName.replaceAll("#/components/schemas/", "");

    var component = metadata["components"]["schemas"][componentName];

    return component as Map<String, dynamic>;
  }
}
