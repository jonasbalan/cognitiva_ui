// import 'dart:convert';
// import 'package:cognitiva_ui/components/dynamicForm.dart';
// import 'package:cognitiva_ui/configuration/config.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class DynamicFormStatelessWidget extends StatelessWidget {
//   final String path;
//   const DynamicFormStatelessWidget({super.key, required this.path});

//   Future<Map<String, dynamic>> getAllScheme() async {
//     final response = await http.get(Uri.parse(
//         '${AppConfig.baseBackEndUrl}${AppConfig.openApiPath}')); //  'https://localhost:63224/api/Address'));
//     final parsed = jsonDecode(response.body) as Map<String, dynamic>;
//     return parsed;
//   }

//   @protected
//   Future<Map<String, dynamic>> getScheme() async {
//     final allScheme = await getAllScheme();

//     var path = allScheme["paths"][""];

//     return allScheme;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Map<String, dynamic>>(
//         future: getScheme(),
//         builder: (BuildContext context,
//             AsyncSnapshot<Map<String, dynamic>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const CircularProgressIndicator();
//           } else if (snapshot.connectionState == ConnectionState.done &&
//               snapshot.data != null) {
//             return DynamicForm(schema: snapshot.data!);
//           } else {
//             return AlertDialog(
//               icon: const Icon(Icons.error),
//               title: const Text("Error"),
//               content: Text(snapshot.error.toString()),
//             );
//           }
//         });
//   }
// }
