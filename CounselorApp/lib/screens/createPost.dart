import 'package:helloworld/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helloworld/services/services.dart';
import 'package:helloworld/services/singleton.dart';

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

  final Singleton _singleton = Singleton();

  List<String> reportList = [
    "internship",
    "volunteering",
    "education",
    "employment",
  ];

  List<String> selectedReportList = [];

  @override
  Widget build(BuildContext context) {
    if (_singleton.currentDocument != null && !_singleton.editDirty) {
      titleController.text = _singleton.currentDocument!["title"];
      title = titleController.text;
      descriptionController.text = _singleton.currentDocument!["description"];
      description = descriptionController.text;
      joinLinkController.text = _singleton.currentDocument!["join_link"];
      joinLink = joinLinkController.text;
      contactLinkController.text = _singleton.currentDocument!["contact_link"];
      contactLink = contactLinkController.text;
      print("Testing: ${_singleton.currentDocument!["doc_id"]}");
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 5,
          ),
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
            ),
            onChanged: (text) {
              _singleton.editDirty = true;
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
              _singleton.editDirty = true;
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
              _singleton.editDirty = true;
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
              _singleton.editDirty = true;
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
          // SizedBox(
          //   height: MediaQuery.of(context).size.height / 6,
          // ),
          SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 95,
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  _singleton.editDirty = false;
                  if (_singleton.currentDocument == null) {
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
                        "posts.${value.id}": {
                          'title': title,
                          'description': description,
                          'join_link': joinLink,
                          'contact_link': contactLink,
                          'author': Auth().user!.uid,
                          'tags': selectedReportList,
                        }
                      }).then((value) =>
                              Navigator.pushNamed(context, '/homeCreator'));
                    });
                  } else {
                    FirebaseFirestore.instance
                        .collection('topics')
                        .doc(_singleton.currentDocument!["doc_id"])
                        .update({
                      'title': title,
                      'description': description,
                      'join_link': joinLink,
                      'contact_link': contactLink,
                      'author': Auth().user!.uid,
                      'tags': selectedReportList,
                    }).then((value) {
                      // print(_singleton.currentDocument);
                      FirebaseFirestore.instance
                          .collection('user_data')
                          .doc(Auth().user!.uid)
                          .update({
                        "posts.${_singleton.currentDocument!["doc_id"]}": {
                          'title': title,
                          'description': description,
                          'join_link': joinLink,
                          'contact_link': contactLink,
                          'author': Auth().user!.uid,
                          'tags': selectedReportList,
                        }
                      }).then((value) {
                        _singleton.currentDocument = null;
                        Navigator.pushNamed(context, '/homeCreator');
                      });
                    });
                  }
                },
                child: const Text('Publish'),
              )),
          // SizedBox(
          //         width: MediaQuery.of(context).size.width / 2 - 10,
          //         height: 70,
          //         child: ElevatedButton(
          //             onPressed: () => _dialogBuilder(context, 0),
          //             child: const Text('Join'))),
          SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 95,
              height: 70,
              child: ElevatedButton(
                child: const Text('Exit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade400,
                ),
                onPressed: () {
                  _singleton.editDirty = false;
                  _singleton.currentDocument = null;
                  Navigator.pop(context);
                },
              )),
        ],
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

  final Singleton _singleton = Singleton();

  _buildChoiceList() {
    List<Widget> choices = [];

    if (_singleton.currentDocument != null && !_singleton.editDirty) {
      for (String item in _singleton.currentDocument!["tags"]) {
        selectedChoices.add(item);
      }
    }

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
                _singleton.editDirty = true;
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
