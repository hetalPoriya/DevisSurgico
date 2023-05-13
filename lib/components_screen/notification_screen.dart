import 'package:driver_apps/utils/app_colors.dart';
import 'package:driver_apps/utils/app_widget.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  final String? id;
  final String? name;

  const NotificationScreen({Key? key, this.id, this.name}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppWidget.appBarWidget(text: 'Notification'),
        body: ListView.builder(
          itemBuilder: (context, position) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                    leading:  Icon(
                      Icons.notifications,
                      color: AppColors.appBarColor,
                    ),
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: const [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "You have incomplete the task",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("You can complete the task......"),
                          ),
                        ],
                      ),
                    )),
              ),
            );
          },
          itemCount: 20,
        ));
  }
}
