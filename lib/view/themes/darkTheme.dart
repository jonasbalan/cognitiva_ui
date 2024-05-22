import 'package:flutter/material.dart';

class DarkTheme extends StatelessWidget {
  final Widget child;

  const DarkTheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(data: getTheme(), child: child);
  }

  ThemeData getTheme() {
    ThemeData result = ThemeData.light(useMaterial3: true);
    //result.cardTheme.color = Colors.amber;

    return result;
  }
}
