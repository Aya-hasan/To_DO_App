import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/database/my_database.dart';
import 'package:to_do_app/database/task_data.dart';
import 'package:to_do_app/ui_design/home/provider/Settingsprovider.dart';
import 'package:to_do_app/utils/date_utils.dart';
import 'package:to_do_app/utils/dialog_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../my_theme.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var settingsprovider=Provider.of<Settingsprovider>(context);
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height ,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  settingsprovider.currentLanguage=='en'?"add new Task":" اضف مهمة جديدة"
                 ,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color:settingsprovider.isDarkMode()?Colors.white:Colors.black ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                //padding: EdgeInsets.symmetric(vertical: 8,horizontal: 14),
                child: TextFormField(
                  controller: titleController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return settingsprovider.currentLanguage=='en'?'Please enter valid title':"ادخل عنوانا صحيحا";
                    }
                  },
                  decoration:  InputDecoration(
                    hintText: settingsprovider.currentLanguage=='en'?"Enter Task Title":"ادخل عنوان المهمه",
                    hintStyle: TextStyle(
                      color: settingsprovider.isDarkMode()?Colors.white:Colors.black,
                      fontSize: 12,
                    ),
                    iconColor: Colors.black12,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                //padding: EdgeInsets.symmetric(vertical: 8,horizontal: 14),
                child: TextFormField(
                  controller: descController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return settingsprovider.currentLanguage=='en'?'Please enter valid description':"ادخل وصفا صحيحا";
                    }
                  },
                  maxLines: 4,
                  minLines: null,
                  decoration: InputDecoration(
                    hintText: settingsprovider.currentLanguage=='en'?"Enter Task Description":"ادخل وصف للمهمة",
                    hintStyle: TextStyle(
                      color: settingsprovider.isDarkMode()?Colors.white:Colors.black,
                      fontSize: 12,
                    ),
                    iconColor: Colors.black12,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: Text(
                  settingsprovider.currentLanguage=='en'?"select date":"اختر تاريخ",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color:settingsprovider.isDarkMode()?Colors.white:Colors.black ),
                    textAlign: TextAlign.center,
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: InkWell(
                    onTap: () {
                      showTaskDatePicker();
                    },
                    child: Text(
                      MyDateUtils.dateFormat(selectedDate),
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
              Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                        child: Text(settingsprovider.currentLanguage=='en'?"Add Task":"اضافة")),
                    onPressed: () {
                      insertTask();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  var selectedDate = DateTime.now();
  void showTaskDatePicker() async {
    var userSelecteDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (userSelecteDate == null) {
      return;
    } else {
      setState(() {
        selectedDate = userSelecteDate;
      });
    }
  }

  void insertTask() async {
    if (formKey.currentState?.validate() == false) {
      return;
    } else {
      Task task = new Task(
          title: titleController.text,
          description: descController.text,
          date: selectedDate);
     MyDialogUtils.showLoadingDialog(context, 'Loading...' ,
          isDismissible: false);

      try {
         MyDatabase.insertTask(task);
        MyDialogUtils.hideDialog(context);
        MyDialogUtils.showMessage(
            context, "Task added successfully ", 'Ok',negativeActionButton: "Cancel", posAction: () {
          Navigator.pop(context);
        },negAction: (){Navigator.pop(context);});
      } catch (e) {
        MyDialogUtils.hideDialog(context);
        MyDialogUtils.showMessage(
            context, "Failed Adding Task ", 'Try Again ', negativeActionButton: "Cancel",
            posAction: () {
          insertTask();
        }, negAction: () {
          Navigator.pop(context);
        });
      }
    }
  }
}
