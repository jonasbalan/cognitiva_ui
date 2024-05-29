import 'package:cognitiva_ui/services/dynamicMetadataReader.dart';
import 'package:flutter/foundation.dart';

class OpenApiSpecsProvider with ChangeNotifier {
  final Map<String, Map<String, Map<String, dynamic>>> _formsSpecs = {};
  final Map<String, Map<String, dynamic>> _listSpecs = {};

  Map<String, dynamic> getFormSpec(String path, String httpMethod) {
    if (_formsSpecs.containsKey(path)) {
      var pathSpec = _formsSpecs[path] as Map<String, Map<String, dynamic>>;
      if (pathSpec.containsKey(httpMethod)) {
        return pathSpec[httpMethod] as Map<String, dynamic>;
      }
      return _getFormHttpMethodSpec(path, httpMethod);
    }
    return _getFormPathSpec(path, httpMethod);
  }

  Map<String, dynamic> _getFormPathSpec(String path, String httpMethod) {
    var formSpec = DynamicMetadaReader().getFormSpec(path, httpMethod);
    Map<String, Map<String, dynamic>> httpMethodSpec = {};
    httpMethodSpec.addAll({httpMethod: formSpec!});
    _formsSpecs.addAll({path: httpMethodSpec});
    //notifyListeners();
    return formSpec;
  }

  Map<String, dynamic> _getFormHttpMethodSpec(String path, String httpMethod) {
    var formSpec = DynamicMetadaReader().getFormSpec(path, httpMethod);
    Map<String, Map<String, dynamic>> httpMethodSpec = {};
    httpMethodSpec.addAll({httpMethod: formSpec!});
    _formsSpecs.updateAll((key, value) => httpMethodSpec);
    //notifyListeners();
    return formSpec;
  }

  //----------------------GetListSpecs --------------------------------

  Map<String, dynamic> getListSpec(String path) {
    if (_listSpecs.containsKey(path)) {
      return _listSpecs[path] as Map<String, dynamic>;
    }
    return _getListPathSpec(path);
  }

  Map<String, dynamic> _getListPathSpec(String path) {
    var listSpec = DynamicMetadaReader().getListSpec(path);
    _listSpecs.addAll({path: listSpec as Map<String, dynamic>});
    //notifyListeners();
    return listSpec;
  }
}
