import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('FireBaseTest')),
            body: Center(child: GetTextFieldValue())));
  }
}

class GetTextFieldValue extends StatefulWidget {
  _TextFieldValueState createState() => _TextFieldValueState();
}

class _TextFieldValueState extends State<GetTextFieldValue> {
  final nameValue = TextEditingController();
  final messageValue = TextEditingController();
  final fbi = FirebaseFirestore.instance;
  String name = '';
  String message = '';

  getTextInputData() {
    setState(() {
      name = nameValue.text;
      message = messageValue.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: nameValue,
                autocorrect: true,
                decoration: new InputDecoration(
                  labelText: "Name",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
//fillColor: Colors.green
                ),
              )),
          Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: messageValue,
                autocorrect: true,
                decoration: new InputDecoration(
                  labelText: "Message",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
//fillColor: Colors.green
                ),
              )),
          ElevatedButton.icon(
            label: Text('Envoyer'),
            icon: Icon(Icons.history_edu_outlined),
            onPressed: () {
              getTextInputData();
              fbi.collection("messages").add({
                "name": "$name",
                "message": "$message",
              }).then((value) {
                print(value.id);
              });
            },
          ),
          ElevatedButton.icon(
            label: Text('Envoyer'),
            icon: Icon(Icons.history_edu_outlined),
            onPressed: () {
              getTextInputData();
              fbi.collection("messages").add({
                "name": "$name",
                "message": "$message",
              }).then((value) {
                print(value.id);
              });
            },
          ),
          Padding(
              padding: EdgeInsets.all(0.8),
              child: Text("Name: $name ;Message: $message",
                  style: TextStyle(fontSize: 20, fontFamily: 'Festive'))),
          Padding(
              padding: EdgeInsets.all(0.8),
              child: Text("Name: $name ;Message: $message",
                  style: TextStyle(fontSize: 20, fontFamily: 'Festive')))
        ],
      ),
    ));
  }
}
