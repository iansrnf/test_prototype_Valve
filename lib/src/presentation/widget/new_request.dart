import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_app/src/core/utils/constants.dart';
import 'package:map_app/src/core/utils/utils_handler.dart';
import 'package:map_app/src/data/models/angle_model/angle_model.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;

class NewRequest extends StatefulWidget {
  final String address;
  final String latitude;
  final String longitude;
  const NewRequest(
      {super.key,
      required this.address,
      required this.latitude,
      required this.longitude});

  @override
  State<NewRequest> createState() => _NewRequestState();
}

class _NewRequestState extends State<NewRequest> {
  // TextEditingController for handling text input
  TextEditingController addressController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController complaintController = TextEditingController();

  // Function to handle sending the request (you can implement your logic here)
  void sendRequest() {
    // Implement your logic to send the request

    // You can add API call or other logic here
  }

  @override
  void initState() {
    // TODO: implement initState
    addressController.text = widget.address;
    latitudeController.text = widget.latitude;
    longitudeController.text = widget.longitude;
    super.initState();
  }

  Future<AngleModel> getAngle() async {
    AngleModel finalAngle = const AngleModel(
        angle: "0", initialAngle: "0", steps: "0", noOfTurns: 0);
    try {
      final angleJson = await http
          .get(Uri.https(valveHostOnline, '/valve'))
          .timeout(const Duration(seconds: 60));
      if (angleJson.statusCode == 200) {
        final angleFromMap = AngleModel.fromJson(jsonDecode(angleJson.body));
        finalAngle = angleFromMap;
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      print(e);
    }
    UtilsHandler.angleModel = finalAngle;
    return finalAngle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Complaint Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ListTile(
                // leading: Icon(Icons.info_outline_rounded,
                //     size: 35, color: Colors.red[500]),
                title: Text("Full Address: ",
                    style: TextStyle(
                        fontSize: 12.sp, fontWeight: FontWeight.w400)),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 80.w,
                      child: TextField(
                        controller: addressController,
                        scrollPadding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).viewInsets.bottom),
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w300),
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0)),
                                borderSide: BorderSide(
                                    color: Colors.black,
                                    style: BorderStyle.solid)),
                            hintText: "Full Address",
                            hintStyle: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w300),
                            fillColor: Colors.white,
                            filled: true),
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                endIndent: 10,
                indent: 10,
                color: Colors.black12,
              ),
              ListTile(
                // leading: Icon(Icons.info_outline_rounded,
                //     size: 35, color: Colors.red[500]),
                title: Text("Complaint",
                    style: TextStyle(
                        fontSize: 12.sp, fontWeight: FontWeight.w400)),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 80.w,
                      child: TextField(
                        controller: complaintController,
                        scrollPadding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).viewInsets.bottom),
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w300),
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0)),
                                borderSide: BorderSide(
                                    color: Colors.black,
                                    style: BorderStyle.solid)),
                            hintText: "Input Complaint here",
                            hintStyle: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w300),
                            fillColor: Colors.white,
                            filled: true),
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                endIndent: 10,
                indent: 10,
                color: Colors.black12,
              ),
              ListTile(
                // leading: Icon(Icons.info_outline_rounded,
                //     size: 35, color: Colors.red[500]),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 40.w,
                            child: const Text("Latitude: ",
                                style: TextStyle(fontSize: 14))),
                        SizedBox(
                            width: 30.w,
                            child: const Text("Longitude: ",
                                style: TextStyle(fontSize: 14))),
                      ],
                    ),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 30.w,
                      child: TextField(
                          enabled: false,
                          onChanged: (val) {},
                          controller: latitudeController,
                          scrollPadding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).viewInsets.bottom + 5),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true, signed: false),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp('[0-9.,]')),
                          ],
                          decoration: const InputDecoration(
                              hintText: "Error Latitude Reading",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7.0)),
                                  borderSide: BorderSide(
                                      color: Colors.black,
                                      style: BorderStyle.solid)))),
                    ),
                    SizedBox(
                      width: 30.w,
                      child: TextField(
                          enabled: false,
                          onChanged: (val) {},
                          controller: longitudeController,
                          scrollPadding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).viewInsets.bottom + 5),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true, signed: false),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp('[0-9.,]')),
                          ],
                          decoration: const InputDecoration(
                              hintText: "Error Latitude Reading",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7.0)),
                                  borderSide: BorderSide(
                                      color: Colors.black,
                                      style: BorderStyle.solid)))),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                endIndent: 10,
                indent: 10,
                color: Colors.black12,
              ),
              StreamBuilder(
                  stream: Stream.periodic(const Duration(microseconds: 500))
                      .asyncMap((i) =>
                          getAngle()), // i is null here (check periodic docs)
                  builder: (context, snapshot) {
                    return Material(
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      elevation: 4.0,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Transform.rotate(
                          angle: (double.parse(UtilsHandler.angleModel.angle!) *
                              (math.pi / 180)),
                          child: const Icon(Icons.arrow_downward),
                        ),
                      ),
                    );
                  }),
              // ListTile(
              //   leading: Icon(Icons.info_outline_rounded,
              //       size: 35, color: Colors.red[500]),
              //   title: const Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text("No. of Months", style: TextStyle(fontSize: 14)),
              //       Text("Balance", style: TextStyle(fontSize: 14))
              //     ],
              //   ),
              //   subtitle: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(consumerData.noOfMonths.toString(),
              //           style: const TextStyle(
              //               fontSize: 18, fontWeight: FontWeight.bold)),
              //       Text(
              //         "P ${a.toStringAsFixed(2)}",
              //         style: const TextStyle(
              //             fontSize: 18, fontWeight: FontWeight.bold),
              //       )
              //     ],
              //   ),
              // ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context, builder: (context) => AlertDialog());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 36, 126, 230),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7))),
                  child: SizedBox(
                    width: 30.w,
                    child: const Center(
                      child: Text(
                        'SEND REQUEST',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    addressController.dispose();
    complaintController.dispose();
    super.dispose();
  }
}
