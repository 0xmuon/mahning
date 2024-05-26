import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final dynamic manhwa;

  DetailsScreen({required this.manhwa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(manhwa['attributes']['title']['en'])),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              manhwa['attributes']['title']['en'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(manhwa['attributes']['description']['en'] ?? 'No description available'),
            // Add more details like chapters list
          ],
        ),
      ),
    );
  }
}
