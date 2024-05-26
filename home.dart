import 'package:flutter/material.dart';
import 'api_service.dart';

class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Popular Manhwa')),
      body: FutureBuilder(
        future: apiService.fetchPopularManhwa(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<dynamic> manhwaList = snapshot.data;
            return ListView.builder(
              itemCount: manhwaList.length,
              itemBuilder: (context, index) {
                var manhwa = manhwaList[index];
                return ListTile(
                  title: Text(manhwa['attributes']['title']['en']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(manhwa: manhwa),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
