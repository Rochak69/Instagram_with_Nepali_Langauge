import 'package:flutter/material.dart';

class TextFieldInput extends StatefulWidget {
  final TextInputAction textInputAction;
  final bool isPass;
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  const TextFieldInput(
      {super.key,
      required this.textEditingController,
      this.textInputAction = TextInputAction.done,
      this.isPass = false,
      required this.hintText,
      required this.textInputType});

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      textInputAction: widget.textInputAction,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      obscureText: widget.isPass,
      keyboardType: widget.textInputType,
    );
  }
}
