import 'package:flutter/material.dart';

class ShelterSearchBar extends StatefulWidget {
  const ShelterSearchBar({Key? key}) : super(key: key);

  @override
  State<ShelterSearchBar> createState() => _ShelterSearchBarState();
}

class _ShelterSearchBarState extends State<ShelterSearchBar> {
  TextEditingController shelterSearchController = TextEditingController();
  bool isSuffixIcon = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: shelterSearchController,
      onChanged: (text) {
        if (shelterSearchController.text.trim().isEmpty != isSuffixIcon) {
          setState(() => isSuffixIcon = !isSuffixIcon);
        }
      },
      decoration: InputDecoration(
        hintText: '보호소명을 입력해주세요.',
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Theme.of(context).disabledColor),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).primaryColor,
        ),
        suffixIcon: Builder(
          builder: (context) {
            if (isSuffixIcon) {
              return const SizedBox.shrink();
            }
            return IconButton(
              onPressed: () {
                shelterSearchController.text = '';
                setState(() => isSuffixIcon = !isSuffixIcon);
              },
              icon: Icon(
                Icons.highlight_remove_rounded,
                color: Theme.of(context).primaryColor,
              ),
            );
          },
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).focusColor,
          ),
          gapPadding: 4,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).focusColor,
          ),
          gapPadding: 4,
        ),
        fillColor: Theme.of(context).focusColor,
        filled: true,
      ),
    );
  }
}
