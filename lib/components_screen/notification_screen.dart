import 'package:flutter/material.dart';
class NotificationScreen extends StatefulWidget {
  final String? id;
  final String? name;
  const NotificationScreen({Key? key,this.id,this.name}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Notification"),
          backgroundColor:const Color(0XFFB71C1C),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              //bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, position) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                    leading: const Icon(
                      Icons.notifications,
                      color: Color(0XFFB71C1C),
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
                            child: Text(
                                "You can complete the task......"),
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