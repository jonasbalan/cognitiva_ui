import 'package:cognitiva_ui/components/dynamicForm.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  Widget getDynamicForm() {
    return DynamicForm(url: Uri.parse(""), schema: const {
      "properties": {
        "id": {"type": "string", "format": "uuid"},
        // "active": {"type": "boolean", "nullable": false},
        "name": {"type": "string", "nullable": true},
        "description": {"type": "string", "nullable": true},
        "street": {"type": "string", "nullable": true},
        "number": {"type": "string", "nullable": true},
        "neighborhood": {"type": "string", "nullable": true},
        "state": {"type": "string", "nullable": true},
        "city": {"type": "string", "nullable": true},
        "country": {"type": "string", "nullable": true},
        "zipCode": {"type": "integer", "format": "int32"}
      },
    });
  }

  @override
  Widget build(BuildContext context) {
    return getDynamicForm();
    //return Scaffold(body: getDynamicForm());
  }
}
