import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helloworld/services/services.dart';

class createPostScreen extends StatefulWidget {
  createPostScreen({Key? key}) : super(key: key);

  // final String title;

  @override
  _createPostScreen createState() => _createPostScreen();
}

class _createPostScreen extends State<createPostScreen> {
  String title = '';
  TextEditingController titleController = TextEditingController();
  String description = '';
  TextEditingController descriptionController = TextEditingController();
  String joinLink = '';
  TextEditingController joinLinkController = TextEditingController();
  String contactLink = '';
  TextEditingController contactLinkController = TextEditingController();

  List<String> reportList = [
    "internship",
    "volunteering",
    "education",
    "employment",
  ];

  List<String> selectedReportList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              controller: descriptionController,
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
              controller: contactLinkController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Contact Link',
              ),
              onChanged: (text) {
                contactLink = text;
              },
            ),
            OutlinedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(MediaQuery.of(context).size.width + 10, 50),
              ),
              onPressed: () {},
              child: Column(
                children: [
                  const Text(
                    "Tags:",
                    style: TextStyle(color: Colors.black),
                  ),
                  MultiSelectChip(
                    reportList,
                    onSelectionChanged: (selectedList) {
                      setState(() {
                        selectedReportList = selectedList;
                      });
                    },
                    maxSelection: 5,
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 10,
                height: 70,
                child: ElevatedButton(
                  child: Text('Publish'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    FirebaseFirestore.instance.collection('topics').add({
                      'title': title,
                      'description': description,
                      'join_link': joinLink,
                      'contact_link': contactLink,
                      'author': Auth().user!.uid,
                      'tags': selectedReportList,
                    }).then((value) {
                      // print(value.id);
                      FirebaseFirestore.instance
                          .collection('user_data')
                          .doc(Auth().user!.uid)
                          .update({
                        "posts": FieldValue.arrayUnion([value.id])
                      }).then((value) => Navigator.pop(context));
                    });
                  },
                )),
            // SizedBox(
            //         width: MediaQuery.of(context).size.width / 2 - 10,
            //         height: 70,
            //         child: ElevatedButton(
            //             onPressed: () => _dialogBuilder(context, 0),
            //             child: const Text('Join'))),
            SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 10,
                height: 70,
                child: ElevatedButton(
                  child: Text('Exit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
          ],
        ),
      ),
    );
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>)? onSelectionChanged;
  final Function(List<String>)? onMaxSelected;
  final int? maxSelection;

  MultiSelectChip(this.reportList,
      {this.onSelectionChanged, this.onMaxSelected, this.maxSelection});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = [];

  _buildChoiceList() {
    List<Widget> choices = [];

    for (var item in widget.reportList) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          selectedColor: Colors.blue[200],
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            if (selectedChoices.length == (widget.maxSelection ?? -1) &&
                !selectedChoices.contains(item)) {
              widget.onMaxSelected?.call(selectedChoices);
            } else {
              setState(() {
                selectedChoices.contains(item)
                    ? selectedChoices.remove(item)
                    : selectedChoices.add(item);
                widget.onSelectionChanged?.call(selectedChoices);
                // print(selectedChoices);
              });
            }
          },
        ),
      ));
    }

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
