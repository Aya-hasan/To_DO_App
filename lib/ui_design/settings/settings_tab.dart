import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/ui_design/settings/LanguageBottomSheet.dart';
import 'package:to_do_app/ui_design/settings/ThemeBottomSheet.dart';

import '../home/provider/Settingsprovider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


 class SettingsTab extends StatefulWidget{

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
void ShowLanguageBottomSheet(){
  showModalBottomSheet(context: context, builder: (buildContext){
   return LanguageBottomSheet();
  });
}
void ShowThemeBottomSheet(){
  showModalBottomSheet(context: context, builder: (buildContext){
    return ThemeBottomSheet();
  });
}
  @override
  Widget build(BuildContext context) {
    var settingsprovider=Provider.of<Settingsprovider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical:20 ,horizontal:40 ,),
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
   children: [Text(AppLocalizations.of(context)!.language, style:Theme.of(context).
   textTheme.headline6?.copyWith(color: settingsprovider.isDarkMode()?
   Colors.white:Colors.black)),

       Container(margin: EdgeInsets.symmetric(vertical: 20),
         padding: EdgeInsets.symmetric(horizontal: 10),
         decoration: BoxDecoration(color:settingsprovider.isDarkMode()?Color(0xFF141922):Colors.white,border:Border.all(width: 1,
             color:Theme.of(context).primaryColor )),
         child: Row(mainAxisAlignment:  MainAxisAlignment.spaceBetween,
           children: [Text(settingsprovider.currentLanguage=='en'?'Endlish':'العربية',style: Theme.of(context).
       textTheme.headline6?.copyWith(fontWeight:FontWeight.normal,color: Theme.of(context).primaryColor),),
IconButton(onPressed: (){ShowLanguageBottomSheet();}, icon:Icon(Icons.arrow_drop_down_circle_rounded,
  color: Theme.of(context).primaryColor,))

],),


),
     Text(AppLocalizations.of(context)!.theme, style:Theme.of(context).textTheme.headline6?.copyWith(color: settingsprovider.isDarkMode()?
     Colors.white:Colors.black)),

     Container(margin: EdgeInsets.symmetric(vertical: 20),
       padding: EdgeInsets.symmetric(horizontal: 10),
       decoration: BoxDecoration(color:settingsprovider.isDarkMode()?Color(0xFF141922):Colors.white,border:Border.all(width: 1,
           color:Theme.of(context).primaryColor )),
       child: Row(
         mainAxisAlignment:  MainAxisAlignment.spaceBetween,
         children: [Text(settingsprovider.isDarkMode()?
    AppLocalizations.of(context)!.dark:AppLocalizations.of(context)!.light,style: Theme.of(context).
         textTheme.headline6?.copyWith(fontWeight:FontWeight.normal,color: Theme.of(context).primaryColor),),
           IconButton(onPressed: (){ShowThemeBottomSheet();}, icon:Icon(Icons.arrow_drop_down_circle_rounded,
             color: Theme.of(context).primaryColor,))

         ],),


     ),
   ],
 ),
    );

  }
}