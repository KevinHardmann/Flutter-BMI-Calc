import 'package:bmi_calc/Presentation/buttons/RoundIconButton.dart';
import 'package:flutter/material.dart';

class AgeOrWeight extends StatelessWidget {
   const AgeOrWeight({Key? key, required this.title, required this.lableText})
      : super(key: key);

  final String title;
  final String lableText;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey[800],
        ),
        height: 185,
        width: 180,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(//Ich brauch ja beim textformfield dann einen textedetingcontroller, ich denke denn muss man so TextEditingController _controller = TextEditingController();
                style: const TextStyle(fontSize: 16), //und das dann irgendwie zum bloc schicken: Wie? Keine Ahnung :D
                autovalidateMode: AutovalidateMode.disabled,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    labelText: lableText,
                    labelStyle: const TextStyle(fontSize: 16)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(icon: Icons.remove, onPressed: () {}),
                const SizedBox(width: 20,),
                RoundIconButton(icon: Icons.add, onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
