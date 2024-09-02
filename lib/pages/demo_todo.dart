import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  final String data;
  final bool etat;
  Function Changestat;
  int j;
  Function delite;

  Todo(
      {required this.data,
      required this.etat,
      required this.Changestat,
      required this.j,
      required this.delite});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Changestat(j);
      },
      child: FractionallySizedBox(
        widthFactor: 0.99,
        child: Container(
          padding: EdgeInsets.all(22),
          margin: EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blueAccent[100],
          ),
          height: 100,
          width: 450,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data,
                style: TextStyle(
                    fontSize: 25,
                    decoration: etat? TextDecoration.lineThrough: TextDecoration.none,
                    color: etat? Colors.black: Colors.white),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Changestat(j);
                    },
                    icon: Icon(etat ? Icons.check : Icons.close),
                  ),
                  IconButton(
                    onPressed: () {
                      delite(j);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
