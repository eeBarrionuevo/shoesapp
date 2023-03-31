import 'package:flutter/material.dart';

class SearchProduct extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Text(
        "buildActions",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("buildResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("buildSuggestions");
  }
}
