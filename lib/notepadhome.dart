import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'notepadadd.dart';
import 'notepadcontent.dart';

class Notepadhome extends StatefulWidget {
  const Notepadhome({Key? key}) : super(key: key);

  @override
  State<Notepadhome> createState() => _NotepadhomeState();
}

class _NotepadhomeState extends State<Notepadhome> {
  Future<dynamic>getdat()async
  {
    final url="http://192.168.29.150:8080/getNotes";
    var res=await get(Uri.parse(url));
    if(res.statusCode==200){
      print(res.body);
      var body=jsonDecode(res.body);
      return body;

    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(backgroundColor: Colors.redAccent,
      onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotepadContent(),));
      },child:Text("+")
    ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: Icon(Icons.sticky_note_2_outlined),
        title: Text("Notepad"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.search_rounded),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 35),
            child: Icon(Icons.notes),
          )
        ],
      ),
      body: FutureBuilder(
        future: getdat(),
        builder: (context,snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting)
            {
              return Center(child: CircularProgressIndicator(),);
            }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!["message"].length,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotpadAdd(),));
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                      ),
                      child: Column(
                        children: [
                          Text(snapshot.data["message"][index]["id"].toString()),
                          Text(snapshot.data["message"][index]["title"].toString()),
                          Text(snapshot.data["message"][index]["content"].toString()),
                        ],
                      ),
                    ),
                  ),
                );
              }
            );
          }
          else
            {
              return Text("somthing wrong");
            }
        }
      ),
    );
  }
}
