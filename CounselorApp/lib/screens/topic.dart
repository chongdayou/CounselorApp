import "package:flutter/material.dart";

class topicEntry extends StatelessWidget {
  final Object? document;
  const topicEntry({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    print(document);
    return Hero(
      tag: 'hero-rectangle',
      child: Card(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("test"),
                      Text('Tags'),
                    ],
                  ),
                  Text('Content Preview'),
                ],
              ))),
    );
  }
}

class TopicScreen extends StatelessWidget {
  final Object? document;
  const TopicScreen({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
