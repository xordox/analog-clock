import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
   // location name for UI
  String time; // time in that location
  String url; //location url for api end point
  bool isDaytime;

  WorldTime({this.url});

  Future<void> getTime() async {
    try{
      Response response =
      await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'].substring(11,16);
      //String offset = data['utc_offset'].substring(1, 3);
      //print(datetime);
      //print(offset);

      //create DateTime object
      //DateTime now = DateTime.parse(datetime);
      //now = now.add(Duration(hours: int.parse(offset)));

      time = datetime;

      //set time property
     // isDaytime =now.hour > 6 && now.hour < 20 ? true : false;
      //time = DateFormat.jm().format(now);

    }catch(e){
      print('caught error: $e');
      time ='err';
    }

  }
}

