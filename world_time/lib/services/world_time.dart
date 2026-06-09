import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
  String location;  // location name for the UI
  String time="";   // the time in that location
  String flag; // Url to an asset flag icon
  String url; // location url for api endpoints

  bool? isDayTime;

  WorldTime({required this.location,required this.flag, required this.url});

  Future<void> getTime() async
  {
    try{
      http.Response response = await http.get(
          Uri.parse('https://time.now/developer/api/timezone/$url')// this is free api so no key is requied
      );
      Map<String,dynamic> data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = (data['utc_offset']).substring(1,3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);
      isDayTime  = (now.hour > 6 && now.hour<20);

    }
    catch(e)
    {
      print("Caught Error:$e");
      time="Couldn't get Data";
    }

  }
}