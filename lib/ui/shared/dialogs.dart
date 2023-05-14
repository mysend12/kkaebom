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

Future<dynamic> simpleConfirmButtonDialog(
  BuildContext context, {
  required TextSpan textSpan,
  double? minWidth,
  double? minHeight,
  double? maxWidth,
  double? maxHeight,
  String leftButton = '네',
  String rightButton = '아니오',
}) {
  minWidth ??= 10;
  minHeight ??= 10;
  maxWidth ??= MediaQuery.of(context).size.width * .5;
  maxHeight ??= MediaQuery.of(context).size.height * .4;

  return showDialog(
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
            child: Column(
              children: [
                RichText(
                  text: textSpan,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop(true);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                      ),
                      child: Text(
                        leftButton,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.background,
                            ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop(false);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                      ),
                      child: Text(
                        rightButton,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.background,
                            ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
