import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'notepadhome.dart';

class NotepadContent extends StatefulWidget {
   NotepadContent({Key? key} ) : super(key: key);

  @override
  State<NotepadContent> createState() => _NotepadContentState();
}

class _NotepadContentState extends State<NotepadContent> {
  TextEditingController txt=TextEditingController();
  TextEditingController txt1=TextEditingController();
  var formkey = GlobalKey<FormState>();

  postdata()async {
    final url = "http://192.168.29.150:8080/addNotes";
    var body = {"title":txt.text,"content":txt1.text};
    var res= await post(Uri.parse(url),body: jsonEncode(body));
   if (res.statusCode==200) {
     print(res.body);
     var r=jsonDecode(res.body);
     if(r["message"]=="inserted"){
       Navigator.of(context).push(MaterialPageRoute(builder: (context) => Notepadhome(),));
     }

   }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(  backgroundColor: Colors.redAccent,
        onPressed: (){
      bool validate = formkey.currentState!.validate();
      if(validate==true)
        {
          postdata();
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Notepadhome(
          ),));
        }


      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Notepadhome(),));
    },child: Text("add")),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: Icon(Icons.arrow_back),
        title: Text("Notes"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.note_alt),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 35),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: txt,
                validator: (o) {
                  if (o!.isEmpty) {
                    return "enter title";
                  }
                },

                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: txt1,
                validator: (n) {
                  if (n!.isEmpty) {
                    return "enter content";
                  }
                },
                decoration: InputDecoration(contentPadding: EdgeInsets.all(70),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
              ),
            )
          ],
        ),
      ),

    );
  }
}
