
import 'package:flutter/material.dart';

class Settingsprovider extends ChangeNotifier{
ThemeMode currentTheme = ThemeMode.light;
String currentLanguage = 'en';
void changeLocal(String newLocal){
  if(currentLanguage==newLocal){return;}
  currentLanguage= newLocal;
  notifyListeners();
}
void changeTheme(ThemeMode newMode){
  if(currentTheme==ThemeMode){return;}
  currentTheme=newMode;
  notifyListeners();
}

bool isDarkMode(){
  return currentTheme==ThemeMode.dark;
}
}