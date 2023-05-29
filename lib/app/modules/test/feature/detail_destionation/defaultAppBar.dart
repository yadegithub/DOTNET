import 'package:flutter/material.dart';



class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Widget child;
  final action;
  const DefaultAppBar({
    Key? key, required this.title, required this.child, this.action,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.0);
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: Color(0xFF26A69A))),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color:Color(0xFF26A69A)),
      leading: child,
      actions: action,
    );
  }
}