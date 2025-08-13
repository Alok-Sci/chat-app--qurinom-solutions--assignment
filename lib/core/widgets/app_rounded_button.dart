
import 'package:chat_app__qurinom_solutions__assignment/core/utils/extensions/build_context.extension.dart';
import 'package:flutter/material.dart';

class AppRoundedButton extends StatelessWidget {
  const AppRoundedButton(
    this.labelText, {
    super.key,
    this.icon,
    required this.onPressed,
  });

  final IconData? icon;
  final String labelText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onPressed,
            label: Text(labelText),
            iconAlignment: IconAlignment.end,
            style: ElevatedButton.styleFrom(
              foregroundColor: context.colorScheme.onPrimary,
              iconColor: context.colorScheme.onPrimary,
              iconSize: 18,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              backgroundColor: context.colorScheme.primary,
              textStyle: context.textTheme.titleMedium,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            icon: icon != null ? Icon(icon) : null,
          ),
        ),
      ],
    );
  }
}