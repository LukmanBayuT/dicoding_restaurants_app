import 'dart:convert';
import 'package:flutter/services.dart';

class GetData {
  Future readJsonRestaurant() async {
    final String response =
        await rootBundle.loadString('assets/restaurants.json');
    final data = await json.decode(response);
    return data;
  }
}
