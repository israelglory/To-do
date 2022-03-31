// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/item_notifier.dart';

class InputItem extends StatefulWidget {
  const InputItem({Key? key}) : super(key: key);

  @override
  State<InputItem> createState() => _InputItemState();
}

class _InputItemState extends State<InputItem> {
  final txt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            child: TextField(
              controller: txt,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Enter your todo',
                prefixIcon: Icon(Icons.task),
              ),
            ),
          ),
          RaisedButton(
            color: Colors.blue,
            onPressed: () async {
              if (txt.text.isEmpty) {
                return;
              }
              await Provider.of<ItemNotifier>(
                context,
                listen: false,
              ).addItem(txt.text);
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
