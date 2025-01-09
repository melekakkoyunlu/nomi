import 'package:flutter/material.dart';

class FilterOptions {
  List<String> selectedCuisines;
  double selectedDistance;

  FilterOptions({
    required this.selectedCuisines,
    required this.selectedDistance,
  });
}

Future<FilterOptions?> showFilterBottomSheet({
  required BuildContext context,
  required List<String> initialCuisines,
  required double initialDistance,
}) async {
  List<String> selectedCuisines = List.from(initialCuisines);
  double selectedDistance = initialDistance;

  return await showModalBottomSheet<FilterOptions>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Filter by Cuisine", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Wrap(
                  spacing: 10.0,
                  children: ["Italian", "Chinese", "Mexican", "Indian", "American"]
                      .map(
                        (cuisine) => CheckboxListTile(
                      title: Text(cuisine),
                      value: selectedCuisines.contains(cuisine),
                      onChanged: (bool? isSelected) {
                        setModalState(() {
                          if (isSelected == true) {
                            selectedCuisines.add(cuisine);
                          } else {
                            selectedCuisines.remove(cuisine);
                          }
                        });
                      },
                    ),
                  )
                      .toList(),
                ),
                SizedBox(height: 16),
                Text("Filter by Distance", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                RadioListTile<double>(
                  title: Text("5 minutes (400m)"),
                  value: 400,
                  groupValue: selectedDistance,
                  onChanged: (value) {
                    setModalState(() {
                      selectedDistance = value!;
                    });
                  },
                ),
                RadioListTile<double>(
                  title: Text("10 minutes (800m)"),
                  value: 800,
                  groupValue: selectedDistance,
                  onChanged: (value) {
                    setModalState(() {
                      selectedDistance = value!;
                    });
                  },
                ),
                RadioListTile<double>(
                  title: Text("15 minutes (1200m)"),
                  value: 1200,
                  groupValue: selectedDistance,
                  onChanged: (value) {
                    setModalState(() {
                      selectedDistance = value!;
                    });
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(FilterOptions(
                      selectedCuisines: selectedCuisines,
                      selectedDistance: selectedDistance,
                    ));
                  },
                  child: Text("Apply Filters"),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
