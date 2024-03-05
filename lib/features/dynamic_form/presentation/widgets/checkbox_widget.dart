import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  final String label;
  final List<String>? options;
  final bool mandatory;
  final Function(List<String>)? onSelectionChanged;

  const CheckBoxWidget(
      {super.key,
      required this.label,
      this.options,
      required this.mandatory,
      required this.onSelectionChanged});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label),
          if (widget.options != null)
            for (String option in widget.options!)
              CheckboxListTile(
                title: Text(
                  option,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                value: selectedOptions.contains(option),
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      selectedOptions.add(option);
                    } else {
                      selectedOptions.remove(option);
                    }
                    // Invoke the callback function whenever the selection changes
                    widget.onSelectionChanged?.call(selectedOptions);
                  });
                },
              ),
          if (widget.mandatory && selectedOptions.isEmpty)
            const Text(
              "This field is required",
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }
}
