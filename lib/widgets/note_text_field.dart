import 'package:flutter/material.dart';

class NoteTextField extends StatelessWidget {
  const NoteTextField({
    super.key,
    required this.ctrl,
    this.maxLength,
    this.maxLines,
    required this.title,
    this.autofocus = false,
    this.enabled = true,
  });

  final TextEditingController ctrl;
  final int? maxLength;
  final int? maxLines;
  final String title;
  final bool autofocus;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: ctrl,
      maxLines: maxLines,
      maxLength: maxLength,
      autofocus: autofocus,
      enabled: enabled,
      
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          hintText: title,
          
          // filled: true,
          border: InputBorder.none),
    );
  }
}
