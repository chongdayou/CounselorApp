import "package:flutter/material.dart";
import 'package:helloworld/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helloworld/services/singleton.dart';
import 'package:helloworld/size_config.dart';

// TOPIC ENTRY FOR STUDENT
class topicEntry extends StatelessWidget {
  final DocumentSnapshot document;
  topicEntry({super.key, required this.document});

  _buildTagsDisplay(var items) {
    List<Widget> choices = [];

    for (var item in items) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          selectedColor: Colors.grey,
          label: Text(
            item,
            style: const TextStyle(fontSize: 10, color: Colors.black),
          ),
          selected: true,
          onSelected: (value) {},
          // onSelected: (selected) {
          //   if (selectedChoices.length == (widget.maxSelection ?? -1) &&
          //       !selectedChoices.contains(item)) {
          //     widget.onMaxSelected?.call(selectedChoices);
          //   } else {
          //     setState(() {
          //       selectedChoices.contains(item)
          //           ? selectedChoices.remove(item)
          //           : selectedChoices.add(item);
          //       widget.onSelectionChanged?.call(selectedChoices);
          //       // print(selectedChoices);
          //     });
          //   }
          // },
        ),
      ));
    }

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    // for (var item in document["tags"]) {
    //   print(item);
    // }
    return Hero(
      tag: document["title"],
      child: Align(
          alignment: Alignment.topCenter,
          child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width - 10,
              // padding: const EdgeInsets.all(8.0),
              child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: Color.fromARGB(164, 163, 204, 220),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((BuildContext context) =>
                                TopicScreen(document: document))));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal! * 40,
                            height: 250,
                            // color: Colors.grey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  document["title"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeVertical!,
                                ),
                                Wrap(
                                  children: _buildTagsDisplay(document["tags"]),
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: _buildTagsDisplay(document["tags"]),
                                // )
                              ],
                            ),
                          ),
                          Container(
                            width: SizeConfig.blockSizeHorizontal! * 40,
                            height: 250,
                            color: Colors.grey,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                document["description"],
                                maxLines: 5,
                              ),
                            ),
                          )
                        ],
                      ))))),
    );
  }
}

// TOPIC ENTRY FOR CREATOR
class creatorEntry extends StatelessWidget {
  final Map<String, dynamic> document;
  creatorEntry({super.key, required this.document});

  final Singleton _singleton = Singleton();

  _buildTagsDisplay(var items) {
    List<Widget> choices = [];

    for (var item in items) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          selectedColor: Colors.grey,
          label: Text(
            item,
            style: const TextStyle(fontSize: 10, color: Colors.black),
          ),
          selected: true,
          onSelected: (value) {},
          // onSelected: (selected) {
          //   if (selectedChoices.length == (widget.maxSelection ?? -1) &&
          //       !selectedChoices.contains(item)) {
          //     widget.onMaxSelected?.call(selectedChoices);
          //   } else {
          //     setState(() {
          //       selectedChoices.contains(item)
          //           ? selectedChoices.remove(item)
          //           : selectedChoices.add(item);
          //       widget.onSelectionChanged?.call(selectedChoices);
          //       // print(selectedChoices);
          //     });
          //   }
          // },
        ),
      ));
    }

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    // for (var item in document["tags"]) {
    //   print(item);
    // }
    return Hero(
      tag: document["title"],
      child: Align(
          alignment: Alignment.topCenter,
          child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width - 10,
              // padding: const EdgeInsets.all(8.0),
              child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: Color.fromARGB(164, 163, 204, 220),
                  child: InkWell(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: ((BuildContext context) =>
                        //         TopicScreen(document: document))));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal! * 40,
                            height: 250,
                            // color: Colors.grey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  document["title"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeVertical!,
                                ),
                                Wrap(
                                  children: _buildTagsDisplay(document["tags"]),
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: _buildTagsDisplay(document["tags"]),
                                // )
                              ],
                            ),
                          ),
                          Container(
                            width: SizeConfig.blockSizeHorizontal! * 40,
                            height: 250,
                            color: Colors.grey,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                document["description"],
                                maxLines: 5,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: SizeConfig.blockSizeVertical! * 8,
                                width: SizeConfig.blockSizeHorizontal! * 15,
                                child: TextButton(
                                  onPressed: () {
                                    _singleton.currentDocument = document;
                                    Navigator.pushNamed(context, '/createPost');
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue),
                                  child: const Icon(
                                    FontAwesomeIcons.penToSquare,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.blockSizeVertical! * 8,
                                width: SizeConfig.blockSizeHorizontal! * 15,
                                child: TextButton(
                                  onPressed: () {
                                    final userRef = FirebaseFirestore.instance
                                        .collection('user_data')
                                        .doc(Auth().user!.uid);

                                    final updates = <String, dynamic>{
                                      "posts.${document["doc_id"]}":
                                          FieldValue.delete(),
                                    };

                                    userRef.update(updates);
                                    FirebaseFirestore.instance
                                        .collection('topics')
                                        .doc(document["doc_id"])
                                        .delete();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red.shade400),
                                  child: const Icon(
                                    FontAwesomeIcons.trash,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              // ElevatedButton.icon(
                              //     icon: const Icon(FontAwesomeIcons.trash),
                              //     style: ElevatedButton.styleFrom(
                              //         minimumSize: Size(
                              //             SizeConfig.blockSizeHorizontal!,
                              //             SizeConfig.blockSizeVertical! * 7.5),
                              //         // padding: EdgeInsets.all(
                              //         //     SizeConfig.blockSizeHorizontal!),
                              //         backgroundColor: Colors.red.shade400),
                              //     onPressed: () {
                              //       final userRef = FirebaseFirestore.instance
                              //           .collection('user_data')
                              //           .doc(Auth().user!.uid);

                              //       final updates = <String, dynamic>{
                              //         "posts.${document["doc_id"]}":
                              //             FieldValue.delete(),
                              //       };

                              //       userRef.update(updates);
                              //       FirebaseFirestore.instance
                              //           .collection('topics')
                              //           .doc(document["doc_id"])
                              //           .delete();
                              //     },
                              //     label: const Text("")),
                            ],
                          )
                        ],
                      ))))),
    );
  }
}

class TopicScreen extends StatelessWidget {
  final DocumentSnapshot document;
  const TopicScreen({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        title: Text(document["title"],
            style: TextStyle(color: Colors.black), textAlign: TextAlign.center),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            constraints: BoxConstraints(
              minHeight: 300,
              maxHeight: 350,
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
                width: 3.0,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Text(
              document["description"],
              style: TextStyle(),
            ),
          ),
          SizedBox(height: 100),
          Container(
            constraints: BoxConstraints(maxHeight: 200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 10,
                    height: 70,
                    child: ElevatedButton(
                        onPressed: () => _dialogBuilder(context, 0),
                        child: const Text('Join'))),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 10,
                    height: 70,
                    child: ElevatedButton(
                        onPressed: () => _dialogBuilder(context, 1),
                        child: const Text('Contact'))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, int type) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        if (type == 0) {
          return AlertDialog(
            title: const Text('Click on the following link to join!'),
            content: Text(document["join_link"]),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Done'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        } else {
          return AlertDialog(
            title: const Text('Here is how to contact us!'),
            content: Text(document["contact_link"]),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Done'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
      },
    );
  }
}
