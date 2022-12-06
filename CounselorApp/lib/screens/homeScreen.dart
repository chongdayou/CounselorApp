import 'package:flutter/material.dart';
import 'package:helloworld/shared/bottomBar.dart';

class homeScreen extends StatelessWidget {
  homeScreen({super.key});
  String searchContent = "";
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextField(
          controller: searchController,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              labelText: 'Search'),
        ),
        GridView.count(
          // MediaQuery.of(context).size.shortestSide < 600 ? 2 : 4,
          crossAxisCount: 1,
          mainAxisSpacing: 20,
          children: [],
        ),
      ]),
      bottomNavigationBar: const navigationBar(),
    );
  }
}
