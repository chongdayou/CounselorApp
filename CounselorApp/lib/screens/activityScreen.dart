import 'package:flutter/material.dart';
import 'package:helloworld/size_config.dart';
import 'package:helloworld/services/singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helloworld/services/services.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final Singleton _singleton = Singleton();

  @override
  Widget build(BuildContext context) {
    print(_singleton.preferences);
    List<activityEntry> activities = _singleton.tags
        .map((tag) => activityEntry(
              tag: tag,
            ))
        .toList();

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 10,
          ),
          // SizedBox(
          //     width: SizeConfig.blockSizeHorizontal! * 95,
          //     height: 50,
          //     child: ElevatedButton(
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //         child: const Text('Leadership'))),
          // SizedBox(
          //     width: SizeConfig.blockSizeHorizontal! * 95,
          //     height: 50,
          //     child: ElevatedButton(
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //         child: const Text('Volunteer'))),
          // SizedBox(
          //     width: SizeConfig.blockSizeHorizontal! * 95,
          //     height: 50,
          //     child: ElevatedButton(
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //         child: const Text('Math'))),
          // SizedBox(
          //     width: SizeConfig.blockSizeHorizontal! * 95,
          //     height: 50,
          //     child: ElevatedButton(
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //         child: const Text('Internship'))),
          Expanded(
              child: ListView(
            scrollDirection: Axis.vertical,
            children: activities,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: SizeConfig.blockSizeHorizontal! / 2 * 95,
                  height: 70,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red.shade300)),
                      child: const Text('Cancel'))),
              SizedBox(
                  width: SizeConfig.blockSizeHorizontal! / 2 * 95,
                  height: 70,
                  child: ElevatedButton(
                      onPressed: () {
                        activities.forEach((element) {
                          _singleton.preferences![element.tag] =
                              element.preference!;
                        });
                        // print("OHO ${_singleton.preferences}");
                        FirebaseFirestore.instance
                            .collection('user_data')
                            .doc(Auth().user!.uid)
                            .update({
                          "preferences": _singleton.preferences
                        }).then((value) => Navigator.pop(context));
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green.shade300)),
                      child: const Text('Confirm'))),
            ],
          )
        ]);
  }
}

class activityEntry extends StatelessWidget {
  activityEntry({super.key, required this.tag});
  final String tag;
  double? preference = 0;
  TextEditingController prefController = TextEditingController();
  final Singleton _singleton = Singleton();

  @override
  Widget build(BuildContext context) {
    preference = (_singleton.preferences![tag] != null)
        ? _singleton.preferences![tag]
        : 0;
    // print("TESTING: ${tag} ${preference}");
    prefController = TextEditingController.fromValue(
        TextEditingValue(text: preference.toString()));
    return SizedBox(
      height: 100,
      child: Card(
          clipBehavior: Clip.antiAlias,
          color: Color.fromARGB(255, 111, 195, 228),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 75,
                height: 100,
                // color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(tag,
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ),
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 20,
                height: 100,
                // color: Colors.grey,
                child: Center(
                    child: TextField(
                  controller: prefController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: '0',
                  ),
                  onChanged: (text) {
                    preference = double.parse(text);
                  },
                )),
              ),
            ],
          )),
    );
  }
}
