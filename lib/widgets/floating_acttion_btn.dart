
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatingActionBtn extends StatelessWidget {
  final Function()? onTap;
  final IconData iconData;

  const FloatingActionBtn({super.key, this.onTap, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      tooltip: "addNote".tr,
      child:  Icon(
        iconData,
        size: 30,
      ),
    );
  }
}