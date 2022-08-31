import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return RawMaterialButton(
      elevation: 0.0,
      onPressed: ()=>onPressed(),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: themeData.colorScheme.secondary,
      child: Icon(icon),
    );
  }
}
