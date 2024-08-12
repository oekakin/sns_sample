import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String newWord = "";

  Future _addFirebaseData() async {
    await FirebaseFirestore.instance.collection("posts").add({
      "name": "House",
      "text": newWord,
      "createdAt": DateTime.now(),
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              newWord = value;
            },
          ),
          ElevatedButton(
              onPressed: (){
                //Firebaseに値を追加
                _addFirebaseData();
                Navigator.pop(context);
              },
              child: const Text("追加"),
          ),
        ],
      ),
    );
  }
}
