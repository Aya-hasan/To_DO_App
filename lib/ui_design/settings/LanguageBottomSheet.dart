
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/provider/Settingsprovider.dart';

class LanguageBottomSheet extends StatefulWidget {

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
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
   settingsprovider.changeLocal('en');
            },
            child:settingsprovider.currentLanguage==('en')?
            getSelectedItem('English'):getunSelectedItem('English'),

          ),
          SizedBox(height:12 ,),
          InkWell( onTap: (){
            settingsprovider.changeLocal('ar');
          },
            child:settingsprovider.currentLanguage==('ar')?
            getSelectedItem('العربيه'):getunSelectedItem('العربيه'),


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
    return   Text(title,style: Theme.of(context).textTheme.headline4,);
  }
}
