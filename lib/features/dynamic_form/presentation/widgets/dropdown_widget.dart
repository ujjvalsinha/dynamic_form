import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  final String label;
  final List<String>? options;
  final bool mandatory;
  final Function(String?)? onSelectionChanged;

  const DropDownWidget(
      {super.key,
      required this.options,
      required this.label,
      required this.mandatory,
      required this.onSelectionChanged});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
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
          DropdownButton<String>(
            value: selectedOption,
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue!;
                widget.onSelectionChanged?.call(selectedOption);
              });
            },
            items: widget.options?.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
          ),
          if (widget.mandatory && selectedOption == null)
            const Text(
              "This field is required",
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
    );

    // DropdownButton<String>(
    //   value: selectedValue,
    //   onChanged: (String? newValue) {
    //     setState(() {
    //       selectedValue = newValue!;
    //     });
    //   },
    //   items: widget.dropdownItems.map((String item) {
    //     return DropdownMenuItem<String>(
    //       value: item,
    //       child: Text(item),
    //     );
    //   }).toList(),
    // );
  }
}
