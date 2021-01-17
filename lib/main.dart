import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List title = List();
  List textarea = List();

  bool isClicked = false;

  String data1="New title",data2;

  var formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    title.add("New Title");
    textarea.add("Text area example");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Example",
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        onSaved: (value){
                          setState(() {
                            data1=value;
                          });
                          title.add(data1);

                        },
                        decoration: InputDecoration(
                          hintText: "Please Enter the Title",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        onSaved: (value){
                          setState(() {
                            data2 = value;
                          });
                          textarea.add(data2);
                        },
                        decoration: InputDecoration(
                          hintText: "Please Enter the Textarea",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )),RaisedButton.icon(label: Text("Save",style: TextStyle(color: Colors.white),),color: Colors.blue,onPressed: save,icon:  Icon(Icons.save,color: Colors.white,),),
                  Column(
                    children:[ SingleChildScrollView(
                      child: ListView.builder(shrinkWrap: true,itemCount: title.length,itemBuilder: (context,index){
                        return Card(child: ListTile(
                          title: Text(title[index]),
                          subtitle: Text(textarea[index]),
                          leading: CircleAvatar(backgroundImage: AssetImage("assets/photos1.jpg"),),
                        ),);
                      }),
                    ),
  ]
                  )

                ],

              ),
            ),
          ),
        ));
  }

  void save() {
    formkey.currentState.save();

    isClicked = true;
  }
}
