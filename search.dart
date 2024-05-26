import 'package:flutter/material.dart';
import 'api_service.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ApiService apiService = ApiService();
  final TextEditingController _controller = TextEditingController();
  List<dynamic> searchResults = [];

  void _search() async {
    final results = await apiService.searchManhwa(_controller.text);
    setState(() {
      searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Search Manhwa',
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: _search,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          var manhwa = searchResults[index];
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
      ),
    );
  }
}
