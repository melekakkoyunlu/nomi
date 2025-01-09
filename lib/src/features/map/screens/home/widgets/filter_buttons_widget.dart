import 'package:flutter/material.dart';
import '../../../../../constants/filters.dart';

void showFilterPopup(BuildContext context) {
  double selectedDistance = defaultDistance;
  List<String> selectedCuisines = [];

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text("Filter Options"),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select Distance (km):"),
                  Slider(
                    value: selectedDistance,
                    min: minDistance,
                    max: maxDistance,
                    divisions: 10,
                    label: "${selectedDistance.toStringAsFixed(1)} km",
                    onChanged: (value) {
                      setState(() {
                        selectedDistance = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  Text("Select Cuisines:"),
                  Column(
                    children: cuisines.map((cuisine) {
                      return CheckboxListTile(
                        title: Text(cuisine),
                        value: selectedCuisines.contains(cuisine),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value == true) {
                              selectedCuisines.add(cuisine);
                            } else {
                              selectedCuisines.remove(cuisine);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedDistance = defaultDistance;
                    selectedCuisines.clear();
                  });
                },
                child: Text("Reset"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  print("Selected Distance: $selectedDistance km");
                  print("Selected Cuisines: $selectedCuisines");
                },
                child: Text("Apply"),
              ),
            ],
          );
        },
      );
    },
  );
}
