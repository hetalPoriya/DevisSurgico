import 'dart:developer';

import 'package:driver_apps/components_screen/route_screens/route_detail.dart';
import 'package:flutter/material.dart';

import '../../api/loginApi.dart';
import '../../model/Route_by_hospital_model.dart';

//import 'package:google_maps/google_maps.dart';
class RouteScreen extends StatefulWidget {
  final String? description;
  final String? id;
  final String? name;

  const RouteScreen({Key? key, this.id, this.name, this.description})
      : super(key: key);

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  // final List<Map<String, dynamic>> _eventslist = [
  //   {
  //     'title': 'Dhanbad',
  //     'Description': 'Asian Dwarkadas Jalan Super Specialty Hospital'
  //   },
  //   {'title': 'Jamshedpur', 'Description': 'Meherbai Tata Memorial Hospital'},
  //   {'title': 'Ranchi', 'Description': 'Orchid Medical Center'},
  //   {'title': 'Jamshedpur', 'Description': 'Tata Main Hospital'},
  //   {'title': 'Ranchi', 'Description': 'Paras HEC Hospital'},
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Route"),
            backgroundColor: const Color(0XFFB71C1C),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  //bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
          ),
          body: FutureBuilder<RouteByHospitalModel>(
              future: LoginApi.hospitalRoutes(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(

                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.data?.length,
                      itemBuilder: (context, index) {
                        return hotelList(snapshot.data!.data![index]);
                      });
                } else if (snapshot.hasError) {
                  log(snapshot.error.toString());
                  return const Center(child: Text("Error"));
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ));
  }

  Widget hotelList(RouteByHospitalData hospitalRoutes) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Address:',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Text(
                    hospitalRoutes.address.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
              //const SizedBox(height: 5),
              const Text(
                "Hospital Name: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
               hospitalRoutes.name.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 190),
                child: TextButton(
                  child: const Text(
                    "View Details",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0XFFB71C1C),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => RouteDetailsScreen(
                              //escription: _eventslist[index]['Description'],
                            )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
