import 'dart:io';

import 'package:band_name/src/models/band.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Cauger', votes: 4),
    Band(id: '2', name: 'Krangal', votes: 0),
    Band(id: '3', name: 'Arfruz', votes: 3),
    Band(id: '4', name: 'Nemucraft', votes: 0)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addNewBand,
        child: Icon(Icons.ac_unit),
        elevation: 1,
      ),
      appBar: AppBar(
        title: Text(
          'BandNames',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: ListView.builder(
          itemCount: bands.length,
          itemBuilder: (BuildContext context, int index) =>
              _bandTile(bands[index])),
    );
  }

  Widget _bandTile(dynamic band) {
    return Dismissible(
        key: Key(band.id),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          print('direccion:${direction}');
          print('id:${band.id}');
        },
        background: Container(
          padding: EdgeInsets.only(left: 8.0),
          color: Colors.red,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Delete Band',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          //child:,
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Text(band.name.substring(0, 2)),
            backgroundColor: Colors.blue[100],
          ),
          title: Text(band.name),
          trailing: Text('${band.votes}'),
          onTap: () {
            print(band.name);
          },
        ));
  }

  void addNewBand() {
    final TextEditingController textEditingController =
        new TextEditingController();
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('New band name'),
            content: TextField(
              controller: textEditingController,
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  addBandList(textEditingController.text);
                },
                child: Text('add'),
                elevation: 5,
                textColor: Colors.blue,
              ),
            ],
          );
        },
      );
    } else {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('New band name'),
              content: TextField(
                controller: textEditingController,
              ),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('close'),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    addBandList(textEditingController.text);
                  },
                  child: Text('add'),
                ),
              ],
            );
          });
    }
  }

  void addBandList(String name) {
    if (name.length > 1) {
      bands.add(Band(id: (bands.length + 1).toString(), name: name, votes: 0));
      setState(() {});
    }
    Navigator.pop(context);
  }
}
