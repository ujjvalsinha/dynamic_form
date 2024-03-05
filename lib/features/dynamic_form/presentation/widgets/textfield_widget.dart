import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final Function(String)? onChanged;
  final String label;
  final TextInputType? textInputType;
  final bool mandatory;
  const TextFieldWidget(
      {super.key,
      required this.label,
      this.textInputType,
      required this.mandatory,
      required this.onChanged});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        keyboardType: widget.textInputType,
        validator: (value) {
          if (widget.mandatory) {
            if (value != null && value != "") {
              return null;
            } else {
              return "field is mandatory";
            }
          }
          return null;
        },
        onChanged: widget.onChanged,
      ),
    );
  }
}
