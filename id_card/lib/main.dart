import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
    home:IdCard(),
  ));
}

class IdCard extends StatefulWidget {
  const IdCard({super.key});

  @override
  State<IdCard> createState() => _IdCardState();
}

class _IdCardState extends State<IdCard> {
  bool darkMode = false;

  Color? appBarColor,
      scaffoldBgColor,
      dividerAndTitleColor,
      labelTextColor,
      mainTextColor;

  @override
  void initState() {
    super.initState();
    updateColors();
  }

  void updateColors() {
    if (darkMode) {
      appBarColor = Colors.grey[850];
      scaffoldBgColor = Colors.grey[900];
      dividerAndTitleColor = Colors.white;
      labelTextColor = Colors.grey;
      mainTextColor = Colors.amber[400];
    } else {
      appBarColor = Colors.grey;
      scaffoldBgColor = Colors.white;
      dividerAndTitleColor = Colors.black;
      labelTextColor = Colors.black;
      mainTextColor = Colors.amber[400];
    }
  }

  void updateDarkMode() {
    setState(() {
      darkMode = !darkMode;
      updateColors();
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        title: Text("ID Card"),
        centerTitle: true,
        backgroundColor: appBarColor,
        foregroundColor: dividerAndTitleColor,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(onPressed: updateDarkMode,
      child: darkMode? Icon(Icons.light_mode):Icon(Icons.dark_mode_rounded),
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
              color: dividerAndTitleColor,
            ),
            Text("Name",
              style: TextStyle(color: labelTextColor,
                  letterSpacing: 2,
                  fontSize: 25.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Polar Bear",
              style: TextStyle(
                  color: mainTextColor,
                  letterSpacing: 2,
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Skill",
              style: TextStyle(color: labelTextColor,
                  letterSpacing: 2,
                  fontSize: 25.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Cooking",
              style: TextStyle(
                  color: mainTextColor,
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
                  color: labelTextColor,
                ),
                SizedBox(width: 10,),
                Text("polarbear@gmail.com"
                  ,style:TextStyle(
                    color: labelTextColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],

        ),
      ),
    );
  }
}
