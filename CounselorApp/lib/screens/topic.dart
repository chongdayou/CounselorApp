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
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        title: Text("Example",
            style: TextStyle(color: Colors.black), textAlign: TextAlign.center),
        elevation: 0,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              "description",
              style: TextStyle(),
            ),
          ),
          Text("buttons"),
        ],
      ),
    );
  }
}
