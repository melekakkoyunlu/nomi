import 'package:flutter/material.dart';
import '../../../map/models/place.dart';

class BookmarksScreen extends StatelessWidget {
  final List<Place> bookmarks;

  const BookmarksScreen({required this.bookmarks, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarks')),
      body: bookmarks.isEmpty
          ? const Center(child: Text('No bookmarks added.'))
          : ListView.builder(
        itemCount: bookmarks.length,
        itemBuilder: (context, index) {
          final place = bookmarks[index];
          return ListTile(
            title: Text(place.name),
            subtitle: Text(
                'Location: ${place.location.latitude}, ${place.location.longitude}'),
          );
        },
      ),
    );
  }
}
