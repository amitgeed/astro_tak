import 'package:astro_tak/model/places_model.dart';
import 'package:astro_tak/provider/home_provider.dart';
import 'package:astro_tak/services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String _displayStringForOption(Places option) => option.placeName!;

  @override
  Widget build(BuildContext context) {
    final placesProvider = Provider.of<HomeProvider>(context);
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  print("Back tapped");
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              ),
              Text(
                "Daily Panchang",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'India is a country known for its festival but knowing the exact dates can sometimes be difficult. To ensure you do not miss out on the critical dates we bring you the daily panchang.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 13),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.orange[50],
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text("Date:"),
                      SizedBox(
                        height: 45,
                      ),
                      Text("Location:"),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        color: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: InkWell(
                          onTap: () {
                            placesProvider.selectDate(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "${placesProvider.selectedDate.day} ${placesProvider.months[placesProvider.selectedDate.month - 1]} ${placesProvider.selectedDate.year}"),
                              // Spacer(),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        color: Colors.white,
                        height: 50,
                        padding: EdgeInsets.zero,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: TypeAheadField<Places?>(
                            hideSuggestionsOnKeyboardHide: false,
                            textFieldConfiguration: TextFieldConfiguration(
                              controller: placesProvider.searchController,
                              decoration: InputDecoration(
                                hintText: 'Serach Place',
                                border: InputBorder.none,
                              ),
                            ),
                            itemBuilder: (context, Places? suggestion) {
                              final places = suggestion!;
                              return ListTile(
                                title: Text(places.placeName!),
                              );
                            },
                            suggestionsCallback: (pattern) async {
                              var data =
                                  await placesProvider.getPlaceData(pattern);
                              return data ?? placesProvider.defaultPlaces;
                            },
                            noItemsFoundBuilder: (context) => Container(
                              height: 100,
                              child: Center(
                                child: Text(
                                  'Search Place Name',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            ),
                            onSuggestionSelected: (Places? suggestion) {
                              if (suggestion!.placeName !=
                                  "Search Place Name") {
                                placesProvider.selecedPlace = suggestion;
                                placesProvider.searchController.text =
                                    suggestion.placeName!;
                                placesProvider.getDailyPanchang();
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          placesProvider.panchangData.day != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          // shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SunriseSunset(
                                icon: CupertinoIcons.sunrise,
                                title: 'Sunrise',
                                time: placesProvider.panchangData.sunrise,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: 40,
                                width: 1.0,
                                color: Colors.grey,
                              ),
                              SunriseSunset(
                                icon: CupertinoIcons.sunset,
                                title: 'Sunset',
                                time: placesProvider.panchangData.sunset,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: 40,
                                width: 1.0,
                                color: Colors.grey,
                              ),
                              SunriseSunset(
                                icon: CupertinoIcons.moon_stars,
                                title: 'Moonrise',
                                time: placesProvider.panchangData.moonrise,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: 40,
                                width: 1.0,
                                color: Colors.grey,
                              ),
                              SunriseSunset(
                                icon: CupertinoIcons.moon_zzz,
                                title: 'Moonset',
                                time: placesProvider.panchangData.moonset,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Tithi",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Table(
                        columnWidths: const <int, TableColumnWidth>{
                          0: FixedColumnWidth(120),
                          1: FlexColumnWidth(),
                        },
                        children: [
                          tableRowWidget(
                            'Tithi Number',
                            placesProvider
                                .panchangData.tithi!.details!.tithiNumber
                                .toString(),
                          ),
                          tableRowWidget(
                            'Tithi Name',
                            placesProvider
                                .panchangData.tithi!.details!.tithiName
                                .toString(),
                          ),
                          tableRowWidget(
                            'Special',
                            placesProvider.panchangData.tithi!.details!.special,
                          ),
                          tableRowWidget(
                            'Summary',
                            placesProvider.panchangData.tithi!.details!.summary,
                          ),
                          tableRowWidget(
                            'Diety',
                            placesProvider.panchangData.tithi!.details!.deity,
                          ),
                          tableRowWidget(
                            'End Time',
                            '${placesProvider.panchangData.tithi!.endTime!.hour} hrs ${placesProvider.panchangData.tithi!.endTime!.minute} min ${placesProvider.panchangData.tithi!.endTime!.second} sec',
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Nakshatra",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Table(
                        columnWidths: const <int, TableColumnWidth>{
                          0: FixedColumnWidth(120),
                          1: FlexColumnWidth(),
                        },
                        children: [
                          tableRowWidget(
                            'Nakshatra Number',
                            placesProvider
                                .panchangData.nakshatra!.details!.nakNumber
                                .toString(),
                          ),
                          tableRowWidget(
                            'Nakshatra Name',
                            placesProvider
                                .panchangData.nakshatra!.details!.nakName,
                          ),
                          tableRowWidget(
                            'Special',
                            placesProvider
                                .panchangData.nakshatra!.details!.special,
                          ),
                          tableRowWidget(
                            'Ruler',
                            placesProvider
                                .panchangData.nakshatra!.details!.ruler,
                          ),
                          tableRowWidget(
                            'Summary',
                            placesProvider
                                .panchangData.nakshatra!.details!.summary,
                          ),
                          tableRowWidget(
                            'Diety',
                            placesProvider
                                .panchangData.nakshatra!.details!.deity,
                          ),
                          tableRowWidget(
                            'End Time',
                            '${placesProvider.panchangData.nakshatra!.endTime!.hour} hrs ${placesProvider.panchangData.nakshatra!.endTime!.minute} min ${placesProvider.panchangData.nakshatra!.endTime!.second} sec',
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Yog",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Table(
                        columnWidths: const <int, TableColumnWidth>{
                          0: FixedColumnWidth(120),
                          1: FlexColumnWidth(),
                        },
                        children: [
                          tableRowWidget(
                            'Yog Number',
                            placesProvider.panchangData.yog!.details!.yogNumber
                                .toString(),
                          ),
                          tableRowWidget(
                            'Yog Name',
                            placesProvider.panchangData.yog!.details!.yogName,
                          ),
                          tableRowWidget(
                            'Special',
                            placesProvider.panchangData.yog!.details!.special,
                          ),
                          tableRowWidget(
                            'Meaning',
                            placesProvider.panchangData.yog!.details!.meaning,
                          ),
                          tableRowWidget(
                            'End Time',
                            '${placesProvider.panchangData.yog!.endTime!.hour} hrs ${placesProvider.panchangData.yog!.endTime!.minute} min ${placesProvider.panchangData.yog!.endTime!.second} sec',
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Karan",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Table(
                        columnWidths: const <int, TableColumnWidth>{
                          0: FixedColumnWidth(120),
                          1: FlexColumnWidth(),
                        },
                        children: [
                          tableRowWidget(
                            'Karan Number',
                            placesProvider
                                .panchangData.karan!.details!.karanNumber
                                .toString(),
                          ),
                          tableRowWidget(
                            'Karan Name',
                            placesProvider
                                .panchangData.karan!.details!.karanName,
                          ),
                          tableRowWidget(
                            'Special',
                            placesProvider.panchangData.karan!.details!.special,
                          ),
                          tableRowWidget(
                            'Deity',
                            placesProvider.panchangData.karan!.details!.deity,
                          ),
                          tableRowWidget(
                            'End Time',
                            '${placesProvider.panchangData.karan!.endTime!.hour} hrs ${placesProvider.panchangData.karan!.endTime!.minute} min ${placesProvider.panchangData.karan!.endTime!.second} sec',
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2),
                  child: Center(
                    child: Text(
                      "No Place is selected\nPlease use searchbox to search place",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  TableRow tableRowWidget(key, value) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(key + ':'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(value ?? ''),
        ),
      ],
    );
  }
}

class SunriseSunset extends StatelessWidget {
  SunriseSunset({
    this.icon,
    this.time,
    this.title,
  });
  final IconData? icon;
  final String? title;
  final String? time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.blue[200],
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          children: [
            Text(title!),
            Text(time!),
          ],
        ),
      ],
    );
  }
}
