import 'package:flutter/material.dart';

class AddressButton extends StatelessWidget {
  AddressButton({
    Key? key,
    required String title,
    bool isArrowButton = false,
    required onPressed,
  })  : _title = title,
        _onPressed = onPressed,
        _isArrowButton = isArrowButton,
        super(key: key);
  final String _title;
  final bool _isArrowButton;
  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: ElevatedButton(
        onPressed: _onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            if (_isArrowButton) const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
