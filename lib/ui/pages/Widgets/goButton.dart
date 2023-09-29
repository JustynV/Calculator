import 'package:f_web_authentication/ui/pages/content/problem_page.dart';
import 'package:flutter/material.dart';

class goButton extends StatelessWidget {
  @override
  goButton(this.name, this.operation);
  final String name;
  final String operation;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        height: 80,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProblemPage(operation: operation)));
          },
          child: Text(
            name,
            style: TextStyle(fontSize: 32.0),
          ),
        ));
  }
}
