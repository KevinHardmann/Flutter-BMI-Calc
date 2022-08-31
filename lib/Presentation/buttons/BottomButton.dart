import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String btnText;
  final Function callback;
  const BottomButton({Key? key, required this.btnText, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkResponse(
      onTap: () => callback(),
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: themeData.colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),

        child: Center(
          child: Text(btnText,
            style: themeData.textTheme.headline1!.copyWith(
                fontSize: 34,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.5
            ),),
        ),
      ),
    );
  }
}
