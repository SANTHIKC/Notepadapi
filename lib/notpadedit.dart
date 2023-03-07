import 'package:flutter/material.dart';

import 'notepadadd.dart';

class Notepadedit extends StatefulWidget {
  const Notepadedit({Key? key}) : super(key: key);

  @override
  State<Notepadedit> createState() => _NotepadeditState();
}

class _NotepadeditState extends State<Notepadedit> {
  TextEditingController txt=TextEditingController();
  TextEditingController txt1=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.redAccent,
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotpadAdd(),));
          },child:Text("update")
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: Icon(Icons.arrow_back),
        title: Text("Note Update"),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: txt,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: txt1,
              decoration: InputDecoration(contentPadding: EdgeInsets.all(70),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            ),
          )
        ],
      ),

    );
  }
}
