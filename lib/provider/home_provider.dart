import 'package:astro_tak/model/panchang_model.dart';
import 'package:astro_tak/model/places_model.dart';
import 'package:astro_tak/services/api_services.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  var places = List<Places>.empty(growable: true);
  var selecedPlace = Places();
  var panchangData = DailyPanchang();
  final searchController = TextEditingController();
  List<Places> defaultPlaces = [
    Places(
      placeId: "",
      placeName: "Search Place Name",
    ),
  ];
  bool loading = false;

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  DateTime selectedDate = DateTime.now();

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      if (selecedPlace.placeId != null) {
        getDailyPanchang();
      }
    }
    notifyListeners();
  }

  Future<List<Places>?> getPlaceData(place) async {
    loading = true;
    // places.clear();
    var res = await ApiServices.getPlaces(place);
    if (res != null) {
      places = res.data!;
      return res.data!;
    }
    loading = false;
    notifyListeners();
  }

  getDailyPanchang() async {
    loading = true;
    var body = {
      "day": selectedDate.day.toString(),
      "month": selectedDate.month.toString(),
      "year": selectedDate.year.toString(),
      "placeId": selecedPlace.placeId,
    };
    var res = await ApiServices.getPanchang(body);
    if (res != null) {
      panchangData = res.data!;
    }
    loading = false;
    notifyListeners();
  }
}
