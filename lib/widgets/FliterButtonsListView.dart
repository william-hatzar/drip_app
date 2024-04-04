import 'package:flutter/material.dart';

class FilterButtonsListView extends StatefulWidget {
  final Set<String> distinctCategories;
  final void Function(String) filterCallback; // Callback function

  const FilterButtonsListView({
    Key? key,
    required this.distinctCategories,
    required this.filterCallback, // Receive the callback function
  }) : super(key: key);

  @override
  State<FilterButtonsListView> createState() => _FilterButtonsListViewState();
}

class _FilterButtonsListViewState extends State<FilterButtonsListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.distinctCategories.length + 1,
        itemBuilder: (_, int index) {
          // Add an "All" filter button
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: InkWell(
                onTap: () => widget.filterCallback("All"), // Call the callback function
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "All",
                    style: const TextStyle(
                        fontFamily: "Poppinns",
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            );
          }
          // Display category filters
          String category = widget.distinctCategories.elementAt(index - 1);
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () => widget.filterCallback(category), // Call the callback function
              child: Container(
                alignment: Alignment.center,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  category,
                  style: const TextStyle(
                      fontFamily: "Poppinns",
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
