import 'package:flutter/material.dart';

class AppBarBtn extends StatelessWidget {
  final IconData iconData;
  final Function() onTap;

  const AppBarBtn({required this.iconData, required this.onTap});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      height: 60,
      width: 60,
      child: Card(
          // margin:
          //     const EdgeInsetsDirectional.symmetric(horizontal: 4, vertical: 8),
          child: TextButton(
        onPressed: onTap,
        child: Icon(
          iconData,
        ),
      )),
    );
  }
}