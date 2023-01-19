import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'setting_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          //backgroundColor: themeCtrl.activeTheme.primaryColor,
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                //Menuitem Elements
                Row(
                  children: [
                    Expanded(
                      child: Text("Show Top Menu",
                          style: controller.activeTheme.textTheme.bodyText1),
                      flex: 1,
                    ),
                    Obx(() {
                      return Expanded(
                          child: Container(
                              alignment: Alignment.centerRight,
                              child: CupertinoSwitch(
                                  value: controller.isShowMenu,
                                  activeColor:
                                      controller.activeTheme.primaryColor,
                                  onChanged: (value) {
                                    controller.isShowMenu = value;
                                  })));
                    }),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text("Activate Dark Mode",
                          style: controller.activeTheme.textTheme.bodyText1),
                      flex: 1,
                    ),
                    Obx(() {
                      return Expanded(
                          child: Container(
                              alignment: Alignment.centerRight,
                              child: CupertinoSwitch(
                                  value: controller.isDarkMode,
                                  activeColor:
                                      controller.activeTheme.primaryColor,
                                  onChanged: (value) {
                                    controller
                                        .setDarkMode(!controller.isDarkMode);
                                  })));
                    }),
                  ],
                ),
              ],
            )));
  }
}
