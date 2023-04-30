import 'package:flutter/material.dart';

class ChatInputBar extends StatefulWidget {
  ChatInputBar({
    Key? key,
    required TextEditingController chatInputController,
  })  : _chatInputController = chatInputController,
        super(key: key);
  final TextEditingController _chatInputController;

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  bool isSubmitButton = false;
  double inputWidth = 0;
  double inputButtonWidth = 80;

  @override
  Widget build(BuildContext context) {
    inputWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: isSubmitButton ? inputWidth - inputButtonWidth : inputWidth,
          constraints: const BoxConstraints(
            minHeight: 50,
            maxHeight: 8 * 24,
          ),
          child: TextField(
            controller: widget._chatInputController,
            keyboardType: TextInputType.multiline,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: null,
            onChanged: (text) {
              setState(() {
                if (text.trim().isEmpty) {
                  isSubmitButton = false;
                } else if (text.trim().isNotEmpty) {
                  isSubmitButton = true;
                }
              });
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
          Row(
            children: [
              SizedBox(
                width: 40,
                child: IconButton(
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    print('plus!!');
                  },
                  icon: const Icon(
                    Icons.add_circle,
                    size: 24,
                  ),
                ),
              ),
              SizedBox(
                width: 40,
                child: IconButton(
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    print('submit!!');
                  },
                  icon: const Icon(
                    Icons.check_circle,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
