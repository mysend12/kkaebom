import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void simpleMessageDialog(
  BuildContext context, {
  required TextSpan textSpan,
  double? minWidth,
  double? minHeight,
  double? maxWidth,
  double? maxHeight,
}) {
  minWidth ??= 10;
  minHeight ??= 10;
  maxWidth ??= MediaQuery.of(context).size.width * .5;
  maxHeight ??= MediaQuery.of(context).size.height * .4;

  showDialog(
    context: context,
    builder: (_) => Dialog(
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 32,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(36.0),
            ),
            color: Theme.of(context).colorScheme.background,
          ),
          constraints: BoxConstraints(
            minWidth: minWidth!,
            minHeight: minHeight!,
            maxWidth: maxWidth!,
            maxHeight: maxHeight!,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: RichText(
              text: textSpan,
            ),
            // child: Text(
            //   message,
            //   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            //         color: Theme.of(context).colorScheme.primary,
            //       ),
            // ),
          ),
        ),
      ),
    ),
  );
}
