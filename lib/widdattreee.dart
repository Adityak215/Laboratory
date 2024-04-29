import 'package:laboratory/auth.dart';
import 'package:laboratory/firelogin.dart';
import 'package:laboratory/firehome.dart';
import 'package:flutter/material.dart';


class WidgetTREEE extends StatefulWidget {
  const WidgetTREEE({super.key});

  @override
  State<WidgetTREEE> createState() => _WidgetTREEEState();
}

class _WidgetTREEEState extends State<WidgetTREEE> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges, 
      builder: ((context, snapshot) {
        if (snapshot.hasData){
          return Firehomie();
        } else {
          return FireloginIG();
        }
      }));
  }
}