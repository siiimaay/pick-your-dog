import 'package:flutter/material.dart';

class Dropdown<T> extends StatefulWidget {
  final List<T> items;
  final String hint;
  final Function(List<T>) onSelectedItemsChanged;
  final List<T> selectedItems;

  const Dropdown({
    super.key,
    required this.items,
    required this.hint,
    required this.onSelectedItemsChanged,
    required this.selectedItems,
  });

  @override
  DropdownState createState() => DropdownState<T>();
}

class DropdownState<T> extends State<Dropdown<T>> {
  bool _isExpanded = false;
  String selectedItem = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffb2b2b2)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            selectedItem.isEmpty
                                ? widget.hint
                                : selectedItem.toString(),
                          ),
                        ),
                        Icon(
                          _isExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: const Color(0xffa2a2a2),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                if (_isExpanded)
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.zero,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: widget.items.length,
                          itemBuilder: (context, index) {
                            final item = widget.items[index];
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(item as String),
                              trailing: selectedItem == item
                                  ? const Icon(
                                      Icons.check_circle,
                                    )
                                  : null,
                              onTap: () {
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                  if (selectedItem == item) {
                                    selectedItem = "";
                                  } else {
                                    selectedItem = item;
                                  }
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
