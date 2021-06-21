import 'package:flutter/material.dart';

class MenuButtons extends StatelessWidget {
  

  const MenuButtons({
    required this.text,
    required this.onPressed ,
    Key? key,
  }) : super(key: key, );

  final String? text;
  final Function? onPressed; 

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: Size(175,75)),
      onPressed:()=> onPressed!(),
      child: Text(
        text!,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
