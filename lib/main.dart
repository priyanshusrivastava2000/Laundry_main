import 'package:flutter/material.dart';
import 'pick_drop_ui/Home_page.dart';
void main() => runApp(Start());

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Laundry -beta",
      theme: ThemeData(
          canvasColor: Colors.transparent,
          scaffoldBackgroundColor: Colors.white
      ),
      home: Home_page(),
    );
  }
}
