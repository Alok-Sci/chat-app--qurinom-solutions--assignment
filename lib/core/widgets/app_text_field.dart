

import 'package:chat_app__qurinom_solutions__assignment/core/utils/extensions/build_context.extension.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20),
        labelText: labelText,
        labelStyle: context.textTheme.bodyLarge?.copyWith(
          color: context.colorScheme.primary,
        ),
        hintText: hintText,
        hintStyle: context.textTheme.bodyMedium?.copyWith(
          color: context.colorScheme.primary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: context.colorScheme.primary, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: context.colorScheme.primary, width: 2),
        ),
      ),
    );
  }
}
