import 'package:flutter/material.dart';

Future<Map<String, dynamic>> showFilterPopup(BuildContext context) async {
  // Seçenekler
  final List<int> walkingTimes = [5, 10, 15]; // Dakikalar
  int selectedTime = 5; // Varsayılan olarak 5 dakika seçili
  List<String> selectedCuisines = [];

  return await showDialog(
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
                  // Uzaklık Seçimi
                  Text("Select Walking Time:"),
                  Wrap(
                    spacing: 8.0,
                    children: walkingTimes.map((time) {
                      return ChoiceChip(
                        label: Text("$time min"),
                        selected: selectedTime == time,
                        onSelected: (isSelected) {
                          setState(() {
                            selectedTime = time;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  // Cuisine Seçimi
                  Text("Select Cuisines:"),
                  Column(
                    children: ["Italian", "Chinese", "Mexican", "Indian"].map((cuisine) {
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
              // Reset Tuşu
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedTime = 5; // Varsayılan 5 dk
                    selectedCuisines.clear();
                  });
                },
                child: Text("Reset"),
              ),
              // Apply Tuşu
              ElevatedButton(
                onPressed: () {
                  // Dakikaları kilometreye çevir
                  double distance = selectedTime * 0.08; // Ortalama hız 0.08 km/dakika
                  Navigator.of(context).pop({
                    "distance": distance,
                    "cuisines": selectedCuisines,
                  });
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
