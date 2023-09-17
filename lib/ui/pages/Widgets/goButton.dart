import 'package:f_web_authentication/ui/pages/content/ProblemPage.dart';
import 'package:flutter/material.dart';

class goButton extends StatelessWidget {
  @override

  goButton(this.name, this.op, this.diff);
  String name;
  String op;
  String diff; 

  Widget build(BuildContext context) {
    return Container(
            width: 250,
      height: 80,
        child: ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProblemPage(difficulty: diff, op: op)));
      },
      child: Text(
        name,
        style: TextStyle(fontSize: 32.0),
      ),
    ));
  }
}