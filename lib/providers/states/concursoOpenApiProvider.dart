import 'package:flutter/foundation.dart';

import '../../mocks/concursoOpenApiMedataMock.dart';

class ConcursoOpenApiProvider with ChangeNotifier {
  Map<String, dynamic>? getFormSpec(String path, String httpMethod) {
    var metadata = concursoOpenApiMetadataMock.getData();
    var pathInfo = metadata["paths"][path];
    String componentName = pathInfo[httpMethod]["parameters"]["requestBody"]
        ["content"]["application/json"]["schema"]["\$ref"];

    componentName = componentName.replaceAll("#/components/schemas/", "");

    var component = metadata["components"]["schemas"][componentName];

    return component as Map<String, dynamic>;
  }
}
