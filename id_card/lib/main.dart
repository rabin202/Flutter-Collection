import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:IdCard(),
  ));
}

class IdCard extends StatelessWidget {
  const IdCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("ID Card"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30,40,30,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/polar_bear.png'),
                radius: 80,
              ),
            ),
            Divider(
              height: 90,
              color: Colors.white,
            ),
            Text("Name",
              style: TextStyle(color: Colors.grey,letterSpacing: 2,fontSize: 25.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Polar Bear",
              style: TextStyle(
                  color: Colors.amber[400],
                  letterSpacing: 2,
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Skill",
              style: TextStyle(color: Colors.grey,letterSpacing: 2,fontSize: 25.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Cooking",
              style: TextStyle(
                  color: Colors.amber[400],
                  letterSpacing: 2,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                SizedBox(width: 10,),
                Text("polarbear@gmail.com"
                  ,style:TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ],
            )
          ],

        ),
      ),
    );
  }
}
