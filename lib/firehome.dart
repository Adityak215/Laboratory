import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laboratory/auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laboratory/cloudy.dart';
import 'package:laboratory/profile.dart';

class Firehomie extends StatefulWidget {
  const Firehomie({super.key});

  @override
  State<Firehomie> createState() => _FirehomieState();
}

class _FirehomieState extends State<Firehomie> {
  final CloudyFire fiyahhhh = CloudyFire();
  TextEditingController tex = TextEditingController();
  String? str = 'title';

  var _imageFile = const Image(
    image: NetworkImage('https://yt3.ggpht.com/yti/ANjgQV8beDJZaUrqoNFbVSi3Wf7dnDRUdmsM5e9Q4a_y6Jw3CpcV=s88-c-k-c0x00ffffff-no-rj'),
    fit: BoxFit.contain,
  );

  final User? user = Auth().currentUser;

  Future<void> signoutttt() async {
    await Auth().signTFOut();
  }

  Widget _userUIDig(String? tex) {
    return Text(
      tex!=null?tex:'Name'
    );
  }

  Widget _signoutButt() {
    return ElevatedButton(
      onPressed: signoutttt,
      child: const Text('Sign out'),
    );
  }

  void _namechange({String? docID}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: TextField(
            controller: tex,
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                if(docID == null){
                  fiyahhhh.addName(tex.text);
                }
                else{
                  fiyahhhh.updateName(docID, tex.text);
                }
                tex.clear();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.check),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Container(
                      height: 120,
                      width: 120,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: _imageFile,
                    ),
                    IconButton(
                      onPressed: _pickImage,
                      color: Colors.purple,
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _userUIDig(str!),
                    IconButton(
                      onPressed: _namechange,
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
              ],
            ),
            StreamBuilder<QuerySnapshot>(
              stream: fiyahhhh.getNameStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<DocumentSnapshot> nameslist = snapshot.data!.docs;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: nameslist.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot docky = nameslist[index];
                      String docID = docky.id;
                      Map<String, dynamic> data = docky.data() as Map<String, dynamic>;
                      String nameText = data['name'];

                      return ListTile(
                        title: Text(nameText),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(onPressed: () => _namechange(docID: docID),
                                icon: const Icon(Icons.adb)),
                            IconButton(onPressed: () => fiyahhhh.deleteName(docID),
                              icon: const Icon(Icons.delete)),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Text("No names");
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: <Widget>[
          FloatingActionButton(onPressed: () {
            Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => Profile()),
                  );
          },),
          FloatingActionButton(
            onPressed: signoutttt,
            child: const Icon(Icons.subdirectory_arrow_left),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery, // Or ImageSource.camera
    );

    if (image != null) {
      setState(() {
        _imageFile = Image.file(
          File(image.path),
          fit: BoxFit.contain,
        );
      });
    }
  }
}
