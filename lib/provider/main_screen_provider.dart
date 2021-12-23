import 'package:flutter/cupertino.dart';

import 'package:astro_tak/bloc/main_screen_bloc.dart';

class MainScreenNotifier with ChangeNotifier {
  int _currentIndex = 0;
  MainScreenBlock? _mainScreenBlock;

  MainScreenNotifier() {
    _mainScreenBlock = MainScreenBlock();
  }

  int get currentIndex => _currentIndex;
  MainScreenBlock get mainScreenBlock => _mainScreenBlock!;

  set setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
