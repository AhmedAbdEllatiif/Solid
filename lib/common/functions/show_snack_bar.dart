import 'package:flutter/material.dart';

/// show snackBar
/// * [context] the current context to show snackBar
/// * [message] the required message to show
void showSnackBar(BuildContext context,
    {required String message,
    Color? textColor,
    Color? backgroundColor,
    bool isFloating = true}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1000),
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: backgroundColor ?? Colors.black,
        behavior:
            isFloating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
        shape: isFloating
            ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
            : const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16))),
        margin: isFloating
            ? const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              )
            : null,
      ),
    );
}
