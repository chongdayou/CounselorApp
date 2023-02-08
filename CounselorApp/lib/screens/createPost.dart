import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class createPostScreen extends StatelessWidget {
  createPostScreen({Key? key}) : super(key: key);
  String title = '';
  TextEditingController titleController = TextEditingController();
  String description = '';
  TextEditingController descriptionController = TextEditingController();
  String joinLink = '';
  TextEditingController joinLinkController = TextEditingController();
  String contactLink = '';
  TextEditingController contactLinkController = TextEditingController();

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
                description = text;
              },
            ),
            TextField(
              controller: joinLinkController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Join Link',
              ),
              onChanged: (text) {
                joinLink = text;
              },
            ),
            TextField(
              controller: joinLinkController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Contact Link',
              ),
              onChanged: (text) {
                contactLink = text;
              },
            ),
            OutlinedButton(
              child: Column(
                children: [
                  Text(
                    "Tags:",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text("[INSERT TAGS HERE]",
                      style: TextStyle(color: Colors.black))
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                minimumSize: Size(MediaQuery.of(context).size.width + 10, 50),
              ),
              onPressed: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            ElevatedButton(
              child: Text('Save and Publish'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {},
            ),
            ElevatedButton(
              child: Text('Save and Exit'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
