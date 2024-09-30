import 'package:flutter/material.dart';
import 'package:topik_sir/config/theme_data/theme_data.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MainAppBar({super.key, required this.title, this.suffixAction, required this.enableBack});
  final String title;
  final Widget? suffixAction;
  final bool enableBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style: UI().titleTheme()),
      leading: enableBack==true?IconButton(
        onPressed: ()=>Navigator.of(context).pop(),
        icon: Container(
          alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow:[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(Icons.arrow_back_ios_new_rounded),
            )),
      ):const SizedBox(),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  const Size.fromHeight(60);
}
