import 'package:flutter/material.dart';
import 'package:geo_app/variants/colors.dart';

class Button extends StatelessWidget {
  final String label;
  final Function onPress;
  final Color? backgroundColor;
  const Button({super.key, required this.label, required this.onPress, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ).copyWith(color: backgroundColor),
      child: TextButton(
        onPressed: () => onPress(),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
