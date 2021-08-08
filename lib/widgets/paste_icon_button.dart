import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasteIconButton extends StatelessWidget {
  const PasteIconButton({Key? key, this.onPaste}) : super(key: key);

  final Function(String)? onPaste;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () async {
        final pasteData = await Clipboard.getData(Clipboard.kTextPlain);
        if (pasteData != null) {
          if (onPaste != null && pasteData.text != null) {
            onPaste!(pasteData.text!);
          }
        }
      },
      icon: Icon(Icons.paste_rounded),
    );
  }
}
