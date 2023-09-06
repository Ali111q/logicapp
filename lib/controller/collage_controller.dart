import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logic_study_app/model/branch.dart';
import 'package:logic_study_app/model/collage.dart';
import 'package:logic_study_app/model/course.dart';
import 'package:logic_study_app/model/university.dart';
import 'package:http/http.dart' as http;
import 'package:logic_study_app/model/video.dart';
import 'package:logic_study_app/utils/constant.dart';
import 'package:overlay_support/overlay_support.dart';
class CollageController extends ChangeNotifier{
  late String token;
  void setToken (String token){
    this.token = token;
    notifyListeners();
  }
  Future<List<University>?>getUniversities()async{
    try {
      
    http.Response _res = await http.get(Uri.parse(getUniversitiesUrl), headers: {
      'Authorization': 'Bearer $token'
    });
    
    print(_res.body);
    if (_res.statusCode == 200) {
      List json = jsonDecode(_res.body);
      List<University> list = json.map((e) => University.fromJson(e)).toList();
      return list;
    }else{
       throw'';
    }
    } catch (e) {
      throw'';
    }
  }
  Future<List<Collage>?>getCollages()async{
    try {
      
    http.Response _res = await http.get(Uri.parse(getCollageUrl), headers: {
      'Authorization': 'Bearer $token'
    });
    
    print(_res.body);
    if (_res.statusCode == 200) {
      List json = jsonDecode(_res.body);
      List<Collage> list = json.map((e) => Collage.fromJson(e)).toList();
      return list;
    }else{
       throw'';
    }
    } catch (e) {
      throw'';
    }
  }
  
  Future<List<Course>?>getCourses()async{
    try {
      
    http.Response _res = await http.get(Uri.parse(getCourseUrl), headers: {
      'Authorization': 'Bearer $token'
    });
    
    print(_res.body);
    if (_res.statusCode == 200) {
      List json = jsonDecode(_res.body);
      List<Course> list = json.map((e) => Course.fromJson(e)).toList();
      return list;
    }else{
       throw'';
    }
    } catch (e) {
      print(e);
      throw'';
    }
  }
  
  Future<List<Branch>?>getCBranches({required List branches})async{
    print(branches);
    List<Branch> list=[];
    
    for (var element in branches) {
      
  
      
    http.Response _res = await http.get(Uri.parse(getBranchUrl(element)), headers: {
      'Authorization': 'Bearer $token'
    });
    if (_res.statusCode == 200) {
      Map json = jsonDecode(_res.body);
       list.add(Branch.fromJson(json));
      
    }else{
       throw'';
    }
  }
    return list;
  }
  Future<List<Video>?>getVideos({required List videos})async{
    print(videos);
    List<Video> list=[];
    
    for (var element in videos) {
      
  
      
    http.Response _res = await http.get(Uri.parse(getVideoUrl(element)), headers: {
      'Authorization': 'Bearer $token'
    });
    if (_res.statusCode == 200) {
      Map json = jsonDecode(_res.body);
      print(json);
       list.add(Video.fromJson(json['data']));
      
    }else{
       throw'';
    }
  }
    return list;
  }

  
}