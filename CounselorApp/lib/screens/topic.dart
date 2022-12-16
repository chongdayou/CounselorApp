import "package:flutter/material.dart";

class topicEntry extends StatelessWidget {
  const topicEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero-rectangle',
      child: Card(
          color: Color.fromARGB(164, 163, 204, 220),
          child: InkWell(
              onTap: () {
                // We are going to go to a topic screen here
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
                      Text("Topic"),
                      Text('Tags'),
                    ],
                  ),
                  Text('Content Preview'),
                ],
              ))),
    );
  }
}
