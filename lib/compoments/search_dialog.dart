import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {

  SearchDialog(this.initialText);

  final String initialText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2,
          left: 6,
          right: 6,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                initialValue: initialText,
                autofocus: true,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onFieldSubmitted: (text) {
                  Navigator.of(context).pop(text);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
