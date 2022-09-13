import 'package:flutter/material.dart';
class TaskCompleteSCreen extends StatefulWidget {
  final String? id;
  final String? name;
  const TaskCompleteSCreen({Key? key,this.id,this.name}) : super(key: key);

  @override
  State<TaskCompleteSCreen> createState() => _TaskCompleteSCreenState();
}

class _TaskCompleteSCreenState extends State<TaskCompleteSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Task Complete"),
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

                    title: Row(
                      children: [
                        Column(
                          children: const [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Hospital Name",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "status",
                                )),
                          ],
                        ),
                        const Icon(Icons.camera_alt)
                      ],
                    )

                ),
              ),
            );
          },
          itemCount: 20,
        ));
  }
}
