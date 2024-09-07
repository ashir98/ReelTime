import 'package:flutter/material.dart';
import 'package:reeltime/models/search_model.dart';
import 'package:reeltime/services/api_services.dart';

class AppNotifier extends ChangeNotifier{
  SearchModel? _searchModel;
  SearchModel? get getSearchModel=>_searchModel;
  

  ApiService apiService = ApiService();

  
  void search(String query){
    apiService.getSearchedMovie(query).then((results){
      _searchModel = results;
      
    });

    notifyListeners();


  }






  bool _isBottombarVisible = true;
  bool get getIsBottombarVisible => _isBottombarVisible;

  hideBottomBar(bool status){
    _isBottombarVisible = status;
    notifyListeners();

  }


}