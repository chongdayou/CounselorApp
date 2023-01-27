import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class createPostScreen extends StatelessWidget {
  createPostScreen({Key? key}) : super(key: key);
  String title = '';
  TextEditingController titleController = TextEditingController();
  String description = '';
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title: ',
              ),
              onChanged: (text) {
                title = text;
              },
            ),
            TextField(
              maxLines: 10,
              controller: titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
              onChanged: (text) {
                title = text;
              },
            ),
          ],
        ),
      ),
    );
  }
}
