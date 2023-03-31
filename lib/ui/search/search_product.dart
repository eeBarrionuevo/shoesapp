import 'package:flutter/material.dart';
import 'package:shoesappclient/models/product_model.dart';

class SearchProduct extends SearchDelegate {
  List<ProductModel> products;
  SearchProduct({required this.products});

  List<String> names = [
    "Elvis",
    "Daniel",
    "Ramón",
    "Julio",
    "Roberto",
    "Maria",
    "Diego",
    "Juan",
    "Melissa",
    "Wilson",
    "Elí",
    "Oliver"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(
          Icons.close,
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
    List<ProductModel> suggestions = products
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(suggestions[index].name),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ProductModel> suggestions = products
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(suggestions[index].name),
        );
      },
    );
  }
}
