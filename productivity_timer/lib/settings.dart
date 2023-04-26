import 'package:flutter/material.dart';
import 'package:productivity_timer/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'),
        centerTitle: true,
      ),
      body: Settings(),
      
      
       );
  }
}

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  TextEditingController? txtWork;
  TextEditingController? txtShort;
  TextEditingController? txtLong;
  SharedPreferences? pref;
  static const String WORKTIME = 'worktime';
  static const String SHORTBREAK = 'shortbreak';
  static const String LONGBREAK = 'longbreak';

  int workTime = 0;
  int shortBreak = 0;
  int longBreak = 0;

  @override
  void initState() {
    txtWork = TextEditingController();
    txtShort = TextEditingController();
    txtLong = TextEditingController();

    readSettings();
    super.initState();
  }

  

  TextStyle textStyle = TextStyle(fontSize: 24);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        scrollDirection: Axis.vertical, // sets the scroll direction to be vertical 
        crossAxisCount: 3, // no of items that will appear on each row
        mainAxisSpacing: 10, 
        crossAxisSpacing: 10,
        childAspectRatio: 3, 
        padding: EdgeInsets.all(20),// item width / item height 
        children: [

          Text('Work' , style: textStyle,),
          Text(''),
          Text(''),

          SettingButton(Color(0xff455A64), '-', -1),
          TextField(
            controller: txtWork,
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ), 
          SettingButton(Color(0xff009688), '+', 1),
          
          Text('Short' , style: textStyle,),
          Text(''),
          Text(''),

          SettingButton(Color(0xff455A64), '-', -1),
          TextField(
            controller: txtShort,
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ), 
          SettingButton(Color(0xff009688), '+', 1),

          Text('Long' , style: textStyle,),
          Text(''),
          Text(''),

          SettingButton(Color(0xff455A64), '-', -1),
          TextField(
            controller: txtLong,
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ), 
          SettingButton(Color(0xff009688), '+', 1),
          
        ],
        

        ),
    );
  }

  void readSettings() async{

    pref = await SharedPreferences.getInstance();
    workTime = pref!.getInt(WORKTIME)!;
    shortBreak = pref!.getInt(SHORTBREAK)!;
    longBreak = pref!.getInt(LONGBREAK)!;

    setState(() {
      
      txtWork!.text = workTime.toString();
      txtShort!.text = shortBreak.toString();
      txtLong!.text = longBreak.toString();
      
          });

  }

  void updateSetting(String key , int value) async {

    switch (key) {
      case WORKTIME:{
        pref = await SharedPreferences.getInstance();
        workTime = pref!.getInt(WORKTIME)!;
        workTime += value;
        if (workTime >= 1 && workTime <= 180){
          pref!.setInt(WORKTIME, workTime);
          setState(() {
            txtWork!.text = workTime.toString();
          });

        } 

      }
      break;
      case SHORTBREAK:{
        pref = await SharedPreferences.getInstance();
        shortBreak = pref!.getInt(SHORTBREAK)!;
        shortBreak += value;
        if (shortBreak >= 1 && shortBreak <= 120){
          pref!.setInt(SHORTBREAK, shortBreak);
          setState(() {
            txtShort!.text = shortBreak.toString();
          });

        } 

      }
        
        break;

      case LONGBREAK:{
        pref = await SharedPreferences.getInstance();
        longBreak = pref!.getInt(LONGBREAK)!;
        longBreak += value;
        if (longBreak >= 1 && longBreak <= 180){
          pref!.setInt(LONGBREAK, longBreak);
          setState(() {
            txtLong!.text = longBreak.toString();
          });

        } 

      }
      break;
      default:
    }
  }
}