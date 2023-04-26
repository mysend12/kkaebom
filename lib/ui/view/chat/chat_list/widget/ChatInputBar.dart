import 'package:flutter/material.dart';

class ChatInputBar extends StatefulWidget {
  ChatInputBar({
    Key? key,
    required TextEditingController chatInputController,
  }) : _chatInputController = chatInputController, super(key: key);
  final TextEditingController _chatInputController;

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  bool isSubmitButton = false;
  double inputWidth = 0;

  @override
  Widget build(BuildContext context) {
    inputWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: inputWidth,
          constraints: const BoxConstraints(
            minHeight: 50,
            maxHeight: 8 * 24,
          ),
          child: TextField(
            controller: widget._chatInputController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: (text) {
              if (widget._chatInputController.text.trim().isEmpty ==
                  isSubmitButton) {
                setState(() {
                  isSubmitButton = !isSubmitButton;
                  inputWidth =
                      isSubmitButton ? inputWidth - 50 : inputWidth + 50;
                });
              }
            },
            decoration: InputDecoration(
              counterText: '',
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
                gapPadding: 4,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                borderSide: BorderSide(
                  width: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
                gapPadding: 4,
              ),
              fillColor: Theme.of(context).colorScheme.background,
              filled: true,
            ),
          ),
        ),
        if (isSubmitButton)
          ElevatedButton(
            onPressed: () {
              print('submit!!');
            },
            child: Container(
              width: 50,
              constraints: BoxConstraints(
                minHeight: 50,
                maxHeight: 300,
              ),
              child: Text('submit'),
            ),
          ),
      ],
    );
  }
}
