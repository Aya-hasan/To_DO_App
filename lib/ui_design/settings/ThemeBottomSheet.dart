
 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/ui_design/home/provider/Settingsprovider.dart';
import 'package:to_do_app/ui_design/my_theme.dart';

class ThemeBottomSheet extends StatefulWidget {


  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsprovider=Provider.of<Settingsprovider>(context);
    return Container(
    padding: EdgeInsets.all(12),
    child:Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    InkWell(
    onTap: (){
      settingsprovider.changeTheme(ThemeMode.light);
    },
    child:  settingsprovider.isDarkMode()?
    getunSelectedItem('Light'):getSelectedItem('Light')),

    SizedBox(height:12 ,),
    InkWell( onTap: (){
      settingsprovider.changeTheme(ThemeMode.dark);
    },
    child:
    settingsprovider.isDarkMode()?getSelectedItem('Dark'):
    getunSelectedItem('Dark'),


),

],

) ,
);
}

Widget getSelectedItem(String title){
return  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(title,
style: Theme.of(context).textTheme.headline4?.
copyWith(color:Theme.of(context). accentColor,),
),
Icon(Icons.check,color: Theme.of(context).accentColor,),

],

);
}

Widget getunSelectedItem(String title){
return   Text(title,style: Theme.of(context).
textTheme.headline4?.copyWith(color: MyTheme.lightPrimary),);
}
}
