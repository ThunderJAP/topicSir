import 'package:flutter/material.dart';

class PracticeCard extends StatelessWidget {
  const PracticeCard(
      {super.key,
      required this.title,
      required this.primaryIconName,
      required this.secondaryIconName, required this.onTap});
  final String title;
  final String primaryIconName;
  final String secondaryIconName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 150,
        //height: 200,
        child: Card(
          elevation: 5,
          child: Column(
            children: [
              const SizedBox(height: 10),
              SizedBox(
                width: 80,
                child: Image.asset(
                    'assets/$primaryIconName'),
              ),
              const SizedBox(height: 10),
              Text(title,
                  style:const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              const SizedBox(height: 10),
              IconButton(onPressed: onTap, icon: const Icon(Icons.play_arrow_rounded,color: Colors.green,size: 50,))
            ],
          ),
        ),
      ),
    );
  }
}
