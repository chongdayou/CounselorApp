import 'package:flutter/material.dart';
import 'package:helloworld/size_config.dart';
import 'package:helloworld/services/singleton.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 10,
      ),
      SizedBox(
          width: SizeConfig.blockSizeHorizontal! * 95,
          height: 50,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Leadership'))),
      SizedBox(
          width: SizeConfig.blockSizeHorizontal! * 95,
          height: 50,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Volunteer'))),
      SizedBox(
          width: SizeConfig.blockSizeHorizontal! * 95,
          height: 50,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Math'))),
      SizedBox(
          width: SizeConfig.blockSizeHorizontal! * 95,
          height: 50,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Internship'))),
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
                  child: const Text('Cancel'))),
          SizedBox(
              width: SizeConfig.blockSizeHorizontal! / 2 * 95,
              height: 70,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Confirm'))),
        ],
      )
    ]);
  }
}
