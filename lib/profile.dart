import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laboratory/firehome.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  User? currUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDeets () async {
    return await FirebaseFirestore.instance.collection("Usermodel").doc(currUser!.email).get();
  }

   var imageDesu = const Image(
    image: NetworkImage('https://yt3.ggpht.com/yti/ANjgQV8beDJZaUrqoNFbVSi3Wf7dnDRUdmsM5e9Q4a_y6Jw3CpcV=s88-c-k-c0x00ffffff-no-rj'),
    fit: BoxFit.contain,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile and shi'),
      ),

      body: FutureBuilder(
        future: getUserDeets(), 
        builder: (context, snapshot) {
          
      },)
    );
  }
}



// Center(
//         child: Column(children: <Widget>[
//           Container(
//                       height: 120,
//                       width: 120,
//                       clipBehavior: Clip.hardEdge,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                       ),
//                       child: imageDesu,
//                     ),

//           SizedBox(height: 20,),


//         ],),
//       ),