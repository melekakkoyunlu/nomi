import 'package:flutter/material.dart';

class FilterButtons extends StatelessWidget {
  final List<FilterData> filters;

  FilterButtons({required this.filters});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: filters.map((filter) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FilterButton(label: filter.label, color: _getColorForLabel(filter.label)),
          );
        }).toList(),
      ),
    );
  }

  // Renk belirlemek için bir yardımcı fonksiyon
  Color _getColorForLabel(String label) {
    switch (label) {
      case 'American':
        return Colors.red;
      case 'Burger':
        return Colors.blue;
      case 'Other':
        return Colors.black;
      default:
        return Colors.grey; // Varsayılan renk
    }
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final Color color;

  FilterButton({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Filter applied: $label")),
        );
      },
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class FilterData {
  final String label;

  FilterData({required this.label});
}
