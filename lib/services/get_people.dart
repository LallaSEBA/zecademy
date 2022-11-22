

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../common/strings_masseges.dart';
import '../models/person.dart';
import '../common/config.dart';

class PeopleService{
  static Future<dynamic> getPeople(int index) async{
    List<Person> people = [];
    String? error;
    try{
    http.Response response = await http.get(
        Uri.parse(index==0 
                  ? '${AppConst.serverUrl}users/'  //first page
                  : '${AppConst.serverUrl}users/?page=$index'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        }
      );

      //statusCode == 200 success
      if(response.statusCode == 200){
        var body = json.decode(response.body);
        try{
          for (Map<String, dynamic> item in body) {
            item['homeworld'] =  await getBirthPlace(item['homeworld']);
          }
        }catch(e){
          if (kDebugMode) {
            print(e);
          }
        } 
        people = Person.peopleFromList(body);
        return people;
      }
      else {
        error = response.reasonPhrase??StrConst.strErrorCmmnMssg;
        throw(error);
      }

    }
    catch(e){
      if(error.toString().toLowerCase()=='not found') {
        print(error);
        return StrConst.strErrorNFoundMssg;
      }
      throw(error ?? StrConst.strErrorCmmnMssg);
    }
  }

   static Future<String> getBirthPlace(String url) async{
    String place = '';
    try{
    http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        }
      );

      var body = json.decode(response.body);
      var place = body['name']?? '';
      return place;  //if return the place else return ''
    }
    catch(e){
      return place;
    }
  }
}
