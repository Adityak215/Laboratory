import 'package:flutter/material.dart';

class Day4 extends StatefulWidget {
  const Day4({super.key});

  @override
  State<Day4> createState() => _Day4State();
}

class _Day4State extends State<Day4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              //margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black,Colors.black,Colors.black, Colors.purple,const Color.fromARGB(255, 100, 93, 93)]
              )),
              child: Column(
                children: [
                  Container(
                    // decoration: BoxDecoration(
                    //  gradient: LinearGradient(
                    //begin: Alignment.topCenter,
                    //end: Alignment.bottomCenter,
                    //colors: [Color.fromARGB(255, 50, 50, 52), Colors.grey],
                    // ),
                    //borderRadius: BorderRadius.all(Radius.circular(20))
                    
                    // ),
                    height: 150,
                    // width: double.infinity,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    margin: EdgeInsets.fromLTRB(10, 60, 10, 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: const Color.fromARGB(255, 67, 67, 67).withOpacity(0.7),
                    ),
                    height: 600,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: Text(
                            'Socials',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [],
                          ),
                          height: 50,
                        ),
                        Container(
                          width: double.infinity,
                          child: Text(
                            'About me',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 95, 88, 88)
                                  .withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Naam bataye, Bhupendra Jogi, US mein kaha kaha gaye hai aap ? Bahut jagah gaya hua hoon...Naam bataye Bhupendra Jogi.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          height: 150,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(8, 10)),
                                color: Colors.pinkAccent,
                              ),
                              child: Text(
                                '#Appdevelopment',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(8, 10)),
                                color: Colors.teal,
                              ),
                              child: Text(
                                '#Webdevelopment',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(8, 10)),
                                color: Color.fromARGB(255, 186, 196, 41),
                              ),
                              child: Text(
                                '#Cybersecurity',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(8, 10)),
                                color: Colors.purple,
                              ),
                              child: Text(
                                '#Appdevelopment',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(8, 10)),
                                color: Colors.blue,
                              ),
                              child: Text(
                                '#Webdevelopment',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 14, 0, 5),
                          width: double.infinity,
                          child: Text(
                            'Suggested for you',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}