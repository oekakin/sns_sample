
import 'package:flutter/material.dart';

class LogingPage extends StatefulWidget {
  const LogingPage({super.key});

  @override
  State<LogingPage> createState() => _LogingPageState();
}

class _LogingPageState extends State<LogingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(),
          TextField(),
          ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text("ログイン"),
          ),
        ],
      ),
    );
  }
}
