import 'dart:async';
import './timermodel.dart';

class CountDownTimer{
  double _raduis = 1;
  bool _isActive = true;
  Timer? timer;
  Duration? _time;
  Duration? _fullTime;
  int work = 30;
  int shortBreak = 5;
  int longBreak = 20;


  void startBreak(bool isShort){
    _raduis = 1;
    int breaktime = (isShort) ? shortBreak : longBreak;
    _time = Duration(minutes: breaktime , seconds: 0);
    _fullTime = _time;
  }


  void stopTimer(){
    _isActive = false;
  }

  void startTimer(){
    if (_time!.inSeconds >0 ){
      _isActive = true;

    }
  }

  void startWork(){
    _raduis = 1;
    _time = Duration(minutes: work , seconds: 0);
    _fullTime = _time;
  }

  String returnTime(Duration t){
    String numMinutes = (t.inMinutes < 10) ? '0' + t.inMinutes.toString() : t.inMinutes.toString();
    int numSeconds = t.inSeconds - (t.inMinutes * 60);
    String seconds = (numSeconds < 10) ? '0' + numSeconds.toString() : numSeconds.toString();

    String timeFormatted = numMinutes + ':' + seconds;

    return timeFormatted;
  }

  Stream<TimerModel> stream() async*{
    yield* Stream.periodic(
      Duration(seconds: 1),
      (int a){
        

        if (_isActive){
          _time = _time! - Duration(seconds: 1);    
          _raduis = _time!.inSeconds / _fullTime!.inSeconds;

          if (_time!.inSeconds <=0){
             _isActive = false;

          }   
         }
       
        String text = returnTime(_time!);
        

        return TimerModel(text: text, percentage: _raduis);
      }
    );
  }


}