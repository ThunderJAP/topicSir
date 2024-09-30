import 'package:flutter/material.dart';
import 'package:topik_sir/config/theme_data/theme_data.dart';

class ConformationDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback continueCallBack;
  const ConformationDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.continueCallBack});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        // This line is added
        borderRadius: BorderRadius.circular(
            12), // Change this value to change the corner radius
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: Text(
        content,
      ),
      actions: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ElevatedButton(
            onPressed: () {
              continueCallBack();
              Navigator.of(context).pop(true);
            },
            child: const Text('Yes', style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(0, 54, 139, 244),
              foregroundColor: Colors.black,
            ),
            child:  Text('No', style: TextStyle(color: Theme.of(context).primaryColor)),
          ),
        ]),
      ],
    );
  }
}
