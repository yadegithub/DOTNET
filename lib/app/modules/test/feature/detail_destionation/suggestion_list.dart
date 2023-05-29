import 'package:flextrip/app/models/item_model.dart';
import 'package:flutter/material.dart';




class SuggestionList extends StatefulWidget {
  SuggestionList({this.title,this.items,Key? key}) : super(key: key);
  String? title;
  List<item>? items;

  @override
  State<SuggestionList> createState() => _SuggestionListState();
}

class _SuggestionListState extends State<SuggestionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
    //   decoration: BoxDecoration(
    //    gradient: LinearGradient(
           
    //  colors:[Colors.indigo.shade900,Colors.indigo.shade800,Colors.indigo.shade300,Colors.indigo.shade200] ),
    //  ),
      //color: secondary,
child: Column(
  children: [
    
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.title!,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0
        ),),
        TextButton(onPressed: (() {
          
        }), child: 
        Text("See All",style: TextStyle(
          color: Color(0xFF26A69A)
        ),)
        )
      ],
    ),
   
  ],
),
    );
    
  }
}