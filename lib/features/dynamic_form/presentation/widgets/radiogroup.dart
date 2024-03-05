import 'package:flutter/material.dart';

class RadioGroupWidget extends StatefulWidget {
  final String label;
  final List<String>? options;
  final bool mandatory;
  final Function(String?)? onSelectionChanged;
  const RadioGroupWidget(
      {super.key,
      required this.label,
      this.options,
      required this.mandatory,
      required this.onSelectionChanged});

  @override
  State<RadioGroupWidget> createState() => _RadioGroupWidgetState();
}

class _RadioGroupWidgetState extends State<RadioGroupWidget> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          if (widget.options != null)
            for (String option in widget.options!)
              RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value;
                    widget.onSelectionChanged?.call(selectedOption);
                  });
                },
              ),
          if (widget.mandatory && selectedOption == null)
            const Text(
              "This field is required",
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }
}
