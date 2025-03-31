import 'package:flutter/material.dart';
import 'package:laboratory/firelogin.dart';


class NumLogin extends StatefulWidget {
  const NumLogin({super.key});

  @override
  State<NumLogin> createState() => _NumLoginState();
}

class _NumLoginState extends State<NumLogin> {

  bool otpcontrol = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),

      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.phone_android_sharp,
            size: 80,
          ),

          const SizedBox(height: 20,),
          const Text('Phone Number Login', 
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 2,                 
              ),
          ),
        const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8 ),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
                hintText: 'Phone number',
              ),
            ),
          ),
      
          Visibility(
            visible: otpcontrol,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8 ),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter OTP',
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),

          ElevatedButton(
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

            onPressed: () {
              if(otpcontrol)
              {
                //submit otp and login
              }
              else{
               setState(() {
                  otpcontrol = !otpcontrol;
               });
              }
          }, 
          child: Text(otpcontrol?'Submit':'Send OTP'),),

          const SizedBox(height: 20,),

          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(onPressed: () {
                
              }, icon: const Icon(Icons.g_mobiledata),
              iconSize: 30,
              ),
              const SizedBox(width: 20,),
              IconButton(onPressed: () {
                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const FireloginIG()),
            );
              }, icon: const Icon(Icons.email_outlined),
                iconSize: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}