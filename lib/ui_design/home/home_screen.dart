import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/ui_design/home/provider/Settingsprovider.dart';
import 'package:to_do_app/ui_design/settings/settings_tab.dart';
import 'package:to_do_app/ui_design/home/tasks_list_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'add_task.dart';

class HomeScreen extends StatefulWidget{
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var settingsprovider=Provider.of<Settingsprovider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo List"),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomAppBar(
        color: settingsprovider.isDarkMode()?Color(0xFF141922):Colors.white,
        shape: CircularNotchedRectangle(
        ),
        notchMargin: 6,
        child: BottomNavigationBar(

          currentIndex: currentIndex,
          onTap: (index){
            currentIndex = index;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list),
                label:AppLocalizations.of(context)!.tasks),
            BottomNavigationBarItem(icon: Icon(Icons.settings),
                label:AppLocalizations.of(context)!.settings),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
          side: BorderSide(
            color: Colors.white,
            width: 4,
          )
        ),
        onPressed: (){
          showAddTaskBottomSheet();
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Tabs[currentIndex],
      );
  }
List<Widget>Tabs = [TasksListTab(),SettingsTab()];
  void showAddTaskBottomSheet() {
    showModalBottomSheet(context: context, builder: (buildContext) {
      return AddTask();
    });
  }
}