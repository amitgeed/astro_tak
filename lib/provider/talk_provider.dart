import 'package:astro_tak/model/astrologer_model.dart';
import 'package:astro_tak/services/api_services.dart';
import 'package:flutter/material.dart';

class TalkProvider with ChangeNotifier {
  var persistAstrosList = List<Astrologer>.empty(growable: true);
  var astrosList = List<Astrologer>.empty(growable: true);
  var loading = false;
  var isSearchVisible = false;
  final searchController = TextEditingController();
  var selectedSortType;
  var skillsList = List<String>.empty(growable: true);
  var languagesList = List<String>.empty(growable: true);
  var selectedLangs = List<String>.empty(growable: true);
  var selectedSkills = List<String>.empty(growable: true);

  getAstrologersList() async {
    loading = true;
    // places.clear();
    var res = await ApiServices.getAstrologers();
    if (res != null) {
      res.forEach((astro) {
        persistAstrosList.add(astro);
      });
      astrosList = res;
      prepareSkillsandLangsList();
    }
    loading = false;
    notifyListeners();
  }

  toggleSearch() {
    isSearchVisible = !isSearchVisible;
    notifyListeners();
  }

  toggleLangs(value, context) {
    // Navigator.pop(context);
    if (selectedLangs.contains(value)) {
      selectedLangs.remove(value);
    } else {
      selectedLangs.add(value);
    }
    filter();
  }

  toggleSkills(value, context) {
    // Navigator.pop(context);
    if (selectedSkills.contains(value)) {
      selectedSkills.remove(value);
    } else {
      selectedSkills.add(value);
    }
    filter();
  }

  filter() {
    if (selectedLangs.isNotEmpty || selectedSkills.isNotEmpty) {
      astrosList.clear();
      selectedLangs.forEach((lang) {
        filterByLanguage(lang);
      });
      selectedSkills.forEach((skill) {
        filterBySkill(skill);
      });
    } else {
      astrosList.addAll(persistAstrosList);
    }
    notifyListeners();
  }

  filterBySkill(filter) {
    persistAstrosList.forEach((astro) {
      astro.skills!.forEach((skill) {
        if (skill.name == filter) {
          if (!astrosList.contains(astro)) {
            astrosList.add(astro);
            notifyListeners();
          }
        }
      });
    });
  }

  filterByLanguage(filter) {
    persistAstrosList.forEach((astro) {
      astro.languages!.forEach((language) {
        if (language.name == filter) {
          if (!astrosList.contains(astro)) {
            astrosList.add(astro);
            notifyListeners();
          }
        }
      });
    });
  }

  selectSortType(SortType value, context) {
    selectedSortType = value;
    Navigator.pop(context);
    sortBy(value);
    notifyListeners();
  }

  sortBy(SortType sortType) {
    if (sortType == SortType.E1) {
      astrosList.sort((a, b) => b.experience.compareTo(a.experience));
    } else if (sortType == SortType.E2) {
      astrosList.sort((a, b) => a.experience.compareTo(b.experience));
    } else if (sortType == SortType.P1) {
      astrosList.sort((a, b) =>
          b.additionalPerMinuteCharges.compareTo(a.additionalPerMinuteCharges));
    } else if (sortType == SortType.P2) {
      astrosList.sort((a, b) =>
          a.additionalPerMinuteCharges.compareTo(b.additionalPerMinuteCharges));
    } else {
      astrosList.clear();
      astrosList.addAll(persistAstrosList);
    }
  }

  prepareSkillsandLangsList() {
    persistAstrosList.forEach((astro) {
      astro.skills!.forEach((skill) {
        if (!skillsList.contains(skill.name)) {
          skillsList.add(skill.name!);
        }
      });
    });
    persistAstrosList.forEach((astro) {
      astro.languages!.forEach((lang) {
        if (!languagesList.contains(lang.name)) {
          languagesList.add(lang.name!);
        }
      });
    });
  }

  searchAstrologer() {
    if (searchController.text != "" || searchController.text != " ") {
      astrosList.clear();
      var filter = searchController.text.toLowerCase();
      searchByName(filter);
      searchBySkill(filter);
      searchBySkill(filter);
    } else {
      astrosList.clear();
      astrosList = persistAstrosList;
      notifyListeners();
    }
  }

  searchByName(filter) {
    persistAstrosList.forEach((astro) {
      if (astro.firstName!.toLowerCase().contains(filter) ||
          astro.lastName!.toLowerCase().contains(filter)) {
        astrosList.add(astro);
        notifyListeners();
      }
    });
  }

  searchBySkill(filter) {
    persistAstrosList.forEach((astro) {
      astro.skills!.forEach((skill) {
        if (skill.name!.toLowerCase().contains(filter)) {
          if (!astrosList.contains(astro)) {
            astrosList.add(astro);
            notifyListeners();
          }
        }
      });
    });
  }

  searchByLanguage(filter) {
    persistAstrosList.forEach((astro) {
      astro.languages!.forEach((language) {
        if (language.name!.toLowerCase().contains(filter)) {
          if (!astrosList.contains(astro)) {
            astrosList.add(astro);
            notifyListeners();
          }
        }
      });
    });
  }

  listToString(List list) {
    var str = "";
    for (var i = 0; i < list.length; i++) {
      str = str + (i != 0 ? " ," : "") + list[i].name!;
    }

    return str;
  }
}

enum SortType { E1, E2, P1, P2, CLR }
