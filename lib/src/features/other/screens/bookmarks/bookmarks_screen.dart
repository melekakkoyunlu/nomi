import 'package:demo/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import '../../../map/models/place.dart';

class BookmarksScreen extends StatelessWidget {
  final List<Place> bookmarks;

  const BookmarksScreen({required this.bookmarks, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(tBookmarks)),
      body: bookmarks.isEmpty
          ? const Center(child: Text(tNoBookmark))
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
