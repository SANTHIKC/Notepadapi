

import 'package:flutter/material.dart';


import 'notepadhome.dart';
import 'notpadedit.dart';

class NotpadAdd extends StatefulWidget {
  const NotpadAdd({Key? key}) : super(key: key);

  @override
  State<NotpadAdd> createState() => _NotpadAddState();
}

class _NotpadAddState extends State<NotpadAdd> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.redAccent,
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Notepadhome(),));
          },child:Text("add ")
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: Icon(Icons.arrow_back),
        title: Text("Note Add"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.edit_note),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 35),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Notepadedit(),));
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                  ),
                ),
              ),
            )

    );
  }
}
