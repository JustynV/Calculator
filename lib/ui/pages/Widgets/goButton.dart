import 'package:f_web_authentication/ui/pages/content/ProblemPage.dart';
import 'package:flutter/material.dart';

class goButton extends StatelessWidget {
  @override
  goButton(this.name, this.op, this.diff, this.setDifficulty);
  String name;
  String op;
  String diff;
  late int result;
  Function setDifficulty;

  Widget build(BuildContext context) {
    return Container(
        width: 250,
        height: 80,
        child: ElevatedButton(
          onPressed: () async {
            int result = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProblemPage(op: op, difficulty: diff)));
            setDifficulty(result);
          },
          child: Text(
            name,
            style: TextStyle(fontSize: 32.0),
          ),
        ));
  }
}
