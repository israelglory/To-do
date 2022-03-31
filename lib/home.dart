// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/input.dart';
import 'package:to_do/model/data.dart';
import 'package:to_do/provider/item_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ItemNotifier>(context, listen: false).initsharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text('My Todo'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return InputItem();
                  });
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<ItemNotifier>(builder: (context, value, _) {
        return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: value.listItem.length,
            itemBuilder: (context, i) {
              return Container(
                margin: EdgeInsets.all(5.0),
                child: Card(
                  elevation: 5,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            value.listItem[i].task,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          onPressed: () {
                            Provider.of<ItemNotifier>(context, listen: false)
                                .removeItem(value.listItem[i]);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Center(child: InputItem());
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
