import 'package:flutter/material.dart';

class Count extends StatefulWidget {

  final int completedTask;
  final int ab;
  Count({required this.completedTask,required this.ab});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.only(top: 22),
            child: Text("${widget.completedTask}/${widget.ab}",style: TextStyle(fontSize: 33),),
          );
  }
}