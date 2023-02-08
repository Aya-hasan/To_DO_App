import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';






import 'package:to_do_app/ui_design/home/edit_task_screen.dart';
import 'package:to_do_app/ui_design/home/home_screen.dart';
import 'package:to_do_app/ui_design/home/provider/Settingsprovider.dart';
import 'package:to_do_app/ui_design/my_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() async{

  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (buidContext)=>Settingsprovider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var settingsprovider=Provider.of<Settingsprovider>(context);
    return MaterialApp(

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales:AppLocalizations.supportedLocales ,
      locale:Locale(settingsprovider.currentLanguage),

      debugShowCheckedModeBanner: false,
      title: "ToDO Application",

      routes: {
        HomeScreen.routeName:(_)=> HomeScreen(),
        EditScreen.RouteName:(_)=>EditScreen(),
      },
      initialRoute: HomeScreen.routeName,

      theme:MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode:settingsprovider.currentTheme ,
    );
  }
}
