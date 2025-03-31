import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laboratory/auth.dart';
import 'package:flutter/material.dart';
import 'package:laboratory/numlogin.dart';


class FireloginIG extends StatefulWidget {
  const FireloginIG({super.key});

  @override
  State<FireloginIG> createState() => _FireloginIGState();
}

class _FireloginIGState extends State<FireloginIG> {

  String? errortextapparently = '';
  bool isLoginfr = true;

  final TextEditingController _emailshi = TextEditingController();
  final TextEditingController _passshi = TextEditingController();
  final TextEditingController _usershi = TextEditingController();
  final TextEditingController _nameshi = TextEditingController();


  Future<void> signwitemailpassWTVR() async{

    showDialog(
      context: context, 
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),);

    try{
      await Auth().signInWEmailPass(
        email: _emailshi.text,
        pass: _passshi.text,);

        if(context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e){
      Navigator.pop(context);
      setState(() {
        errortextapparently = e.message;
      });
    }
  }

  Future<void> createFireUserWitEmailPass() async {

    showDialog(
      context: context, 
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),);

    try{
      UserCredential? userCred = await Auth().createUserWEmailPass(
        email: _emailshi.text, 
        // usern: _usershi.text,
        pass: _passshi.text);

        makeUserDoc(userCred);

        if(context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e){
      Navigator.pop(context);
      setState(() {
        errortextapparently = e.message;
      });
    }
  }

  Future<void> makeUserDoc(UserCredential? userCred) async {
    if(userCred!= null && userCred.user != null){
      await FirebaseFirestore.instance.collection("Usermodel").doc(userCred.user!.email).set({
        'title' : _nameshi.text,
        'email' : userCred.user!.email,
        'usern' : _usershi.text,
        'bio' : '',
      });
    }
  }


  Widget _entryareaaaa(String title, TextEditingController cuntroller, Icon ikun){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8 ),
      child: TextField(
        controller: cuntroller,
        decoration: InputDecoration(
          prefixIcon: ikun,
                border: const OutlineInputBorder(),
                labelText: title,
              ),
      ),
    );
  }

  Widget _errobitch(){
    return Text(errortextapparently == ''?'': 'DUDE? $errortextapparently');
  }
  
  Widget _submitterrr(){
    return ElevatedButton(
      style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Colors.black26),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
            minimumSize: WidgetStateProperty.all<Size>(const Size(150, 50)),
            fixedSize: WidgetStateProperty.all<Size>(const Size(200, 50)),
            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            shape: WidgetStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
      onPressed: isLoginfr? signwitemailpassWTVR: createFireUserWitEmailPass, 
      child: Text(isLoginfr? 'Loginnnn' : 'Register'),
      );
  }

  Widget _loginRegistrwotttt(){
    return TextButton( 
      onPressed: (){
        setState(() {
          isLoginfr = !isLoginfr;
        });
      }, 
      child: Text(isLoginfr? 'Register Instead': 'Login Instead')
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               const Icon(Icons.email_outlined,
              size: 80,
            ),
          
            const SizedBox(height: 20,),
            const Text('Email Login', 
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,                 
                ),
            ),
            const SizedBox(height: 20,),
              _entryareaaaa('email', _emailshi, const Icon(Icons.email)),
              Visibility(visible: !isLoginfr ,child: _entryareaaaa('Username', _usershi, const Icon(Icons.person))),
              Visibility(visible: !isLoginfr ,child: _entryareaaaa('Display Name', _nameshi, const Icon(Icons.person_add_alt_outlined))),
              _entryareaaaa('passwordddddd', _passshi, const Icon(Icons.abc)),
              _errobitch(),
              _submitterrr(),
              _loginRegistrwotttt(),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(onPressed: () {
                    
                  }, icon: const Icon(Icons.g_mobiledata)),
          
                  IconButton(onPressed: () {
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const NumLogin()),
                );
                  }, icon: const Icon(Icons.phone)),
                ],
              ),
            ],
          ),
        ),
      ),
    
    );
  }
}