import 'dart:convert';

import 'package:astro_tak/model/astrologer_model.dart';
import 'package:astro_tak/model/panchang_model.dart';
import 'package:astro_tak/utils/app_urls.dart';
import 'package:http/http.dart' as http;
import 'package:astro_tak/model/places_model.dart';

class ApiServices {
  static Future<PlacesModel?> getPlaces(place) async {
    try {
      final response = await http.get(
        Uri.parse(AppUrls.PLACES + place),
      );
      if (response.statusCode == 200) {
        var result = placesModelFromJson(response.body);
        if (result.success!) {
          return result;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<PanchangModel?> getPanchang(body) async {
    try {
      final response = await http.post(
        Uri.parse(AppUrls.PANCHANG),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        var result = panchangModelFromJson(response.body);
        if (result.success!) {
          return result;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<List<Astrologer>?> getAstrologers() async {
    try {
      final response = await http.get(
        Uri.parse(AppUrls.ASTROLOGER),
      );
      if (response.statusCode == 200) {
        var result = astrologerModelFromJson(response.body);
        if (result.success!) {
          return result.data;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
