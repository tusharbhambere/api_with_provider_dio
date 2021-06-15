import 'dart:developer';

import 'package:bgmi_tip_tricks/core/Model/photo_model.dart';
import 'package:bgmi_tip_tricks/core/Services/get_service.dart';
import 'package:flutter/material.dart';

enum ServicesLoadStatus {
  completed,
  searching,
  empty,
}

class ServicesViewModel with ChangeNotifier {
  List<PhotoModel> services = [];
  ServicesLoadStatus loadStatus = ServicesLoadStatus.searching;
  notifyListeners();
  Future<void> getServices() async {
    this.loadStatus = ServicesLoadStatus.searching;
    var singlePageList = await GetServices().getservices();
    if (singlePageList != null) {
      if (services.isNotEmpty) {
        services.clear();
      }
      singlePageList.map((service) {
        services.add(service);
      }).toList();
      log('services $services');
      this.loadStatus = ServicesLoadStatus.completed;
      notifyListeners();
    } else {
      this.loadStatus = ServicesLoadStatus.empty;
      notifyListeners();
    }
  }
}
