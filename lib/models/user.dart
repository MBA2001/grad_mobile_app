import 'dart:collection';
import 'package:gradproject/services/utils.dart';


class User {
  String uid;
  String email;
  String username;
  String image;
  Map schedule;
  List<String> patientsImages = [];
  List<String> patientsNames= [];
  List<String> patientsPredictions = [];

  User(this.uid,this.email,this.username,this.image,this.schedule);

  addPatientImage(String patientImage){
    patientsImages.add(patientImage);
  }

  addPatientName(String patientName){
    patientsNames.add(patientName);
  }

  addPatientPrediction(String patientprediction){
    patientsPredictions.add(patientprediction);
  }

  addSchedule(){
    Map updatedSchedule = {};
    schedule.forEach((key, value) { 
      for(var i in schedule[key]){
        updatedSchedule[key] == null? updatedSchedule[key] = [Event(i)] : updatedSchedule[key].add(Event(i)); 
      }
    });
    schedule = updatedSchedule;
    print(schedule);
  }
  
}
