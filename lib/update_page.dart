import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sns_app/post.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage(this.post, {super.key});

  final Post post;

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String updatedWord ="";

  Future _updateFirebaseData() async {
    await FirebaseFirestore.instance.collection("posts").doc(widget.post.id).update({
      "name": "House",
      "text": updatedWord,
      "updatedAt": DateTime.now(),
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update"),),
      body: Column(
        children: [
          TextFormField(
            initialValue: widget.post.text,
            onChanged: (value) {
              updatedWord = value;
              setState(() {});
            },
          ),
          ElevatedButton(
            onPressed: updatedWord.isEmpty ? null : (){
              //Firebaseに値を追加
              _updateFirebaseData();
              Navigator.pop(context);
            },
            child: const Text("更新"),
          ),
        ],
      ),
    );
  }
}
