import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:map_app/src/core/utils/constants.dart';
import 'package:map_app/src/core/utils/utils_handler.dart';
import 'package:map_app/src/data/models/angle_model/angle_model.dart';
import 'package:http/http.dart' as http;
import 'package:percentages_with_animation/percentages_with_animation.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:toggle_switch/toggle_switch.dart';

class _ArcPainter extends CustomPainter {
  _ArcPainter();

  @override
  bool shouldRepaint(_ArcPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);

    Path path = Path()
      ..arcTo(
          rect,
          ((double.parse(UtilsHandler.angleModel.initialAngle!) + 90) *
              (math.pi / 180)),
          -pi / 4,
          true);
    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.orange
          ..strokeWidth = 3.0
          ..style = PaintingStyle.stroke);

    // canvas.drawArc(
    //     rect,
    //     0.0,
    //     pi / 2,
    //     false,
    //     Paint()
    //       ..color = Colors.teal
    //       ..strokeWidth = 3.0
    //       ..style = PaintingStyle.stroke);
  }
}

class ShowValveModal extends StatefulWidget {
  const ShowValveModal({super.key});

  @override
  State<ShowValveModal> createState() => _ShowValveModalState();
}

class _ShowValveModalState extends State<ShowValveModal> {
  late IO.Socket socket;
  final StreamController<String> _streamController = StreamController<String>();
  Stream<String> get messagesStream => _streamController.stream;
  TextEditingController txtValveSize = TextEditingController();
  Stream<AngleModel> getPeriodicStream() async* {
    yield* Stream.periodic(const Duration(milliseconds: 500), (_) {
      AngleModel finalAngle = const AngleModel(
          angle: "0", initialAngle: "0", steps: "0", noOfTurns: 0);
      socket.emitWithAck('getValve', UtilsHandler.count, ack: (value) {
        try {
          final angleFromMap = AngleModel.fromJson(value);
          finalAngle = angleFromMap;
        } catch (e) {
          print(e);
        }
        UtilsHandler.angleModel = finalAngle;
      });
      UtilsHandler.count++;
      return finalAngle;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    socket = IO.io(
      'https://valve.gscwd.app',
      <String, dynamic>{
        'transports': ['websocket']
      },
    );

    socket.onConnect((data) {
      socket.on('getValve', (data) {
        _streamController.add(data);
      });
    });

    //socket.emit('carrito:all', {'id': userid});
    socket.on('getValve', (data) {
      _streamController.add(data);
    });
    socket.connect();
    super.initState();
  }

  void sendMessage(String message) {
    // Send a message to the server
    socket.emitWithAck('getValve', UtilsHandler.count, ack: (value) {
      AngleModel finalAngle = const AngleModel(
          angle: "0", initialAngle: "0", steps: "0", noOfTurns: 0);
      try {
        final angleFromMap = AngleModel.fromJson(jsonDecode(value));
        finalAngle = angleFromMap;
      } catch (e) {
        print(e);
      }
      UtilsHandler.angleModel = finalAngle;
    });
    UtilsHandler.count++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Valve Status'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            // Just ensure this is set:
            bottom: MediaQuery.of(context).viewInsets.bottom),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: Icon(
                Icons.account_circle_sharp,
                size: 35,
                color: Colors.blue[600],
              ),
              title: const Text("Valve Name: ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text("Valve One"),
            ),
            const Divider(
              thickness: 1,
              endIndent: 10,
              indent: 10,
              color: Colors.black12,
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                size: 35,
                color: Colors.blue[600],
              ),
              title: const Text("Calibration Mode: ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: SizedBox(
                width: 30.w,
                child: ToggleSwitch(
                  animationDuration: 200,
                  animate: true,
                  cornerRadius: 40,
                  activeBgColors: const [
                    [Colors.red],
                    [Colors.blue]
                  ],
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  labels: const ['OFF', 'ON'],
                  onToggle: (index) async {
                    if (index == 0) {
                      UtilsHandler.isCalibrationMode = false;
                      txtValveSize.text =
                          UtilsHandler.angleModel.noOfTurns.toString();
                    } else {
                      UtilsHandler.isCalibrationMode = true;
                    }
                    print('switched to: $index');
                  },
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              endIndent: 10,
              indent: 10,
              color: Colors.black12,
            ),
            ListTile(
              leading: Icon(
                Icons.settings_applications_rounded,
                size: 35,
                color: Colors.blue[600],
              ),
              title: const Text("Valve Status: ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: SizedBox(
                width: 35.w,
                child: ToggleSwitch(
                  animationDuration: 200,
                  animate: true,
                  cornerRadius: 40,
                  activeBgColors: const [
                    [Colors.red],
                    [Colors.blue]
                  ],
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  labels: const ['STOP', 'START'],
                  onToggle: (index) async {
                    if (index == 0) {
                      UtilsHandler.isValveActive = false;
                      try {
                        socket.emit('changeStats', 0);
                      } catch (e) {
                        print(e);
                      }
                    } else {
                      UtilsHandler.isValveActive = true;
                      try {
                        socket.emit('changeStats', 2);
                      } catch (e) {
                        print(e);
                      }
                    }
                    print('switched to: $index');
                  },
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              endIndent: 10,
              indent: 10,
              color: Colors.black12,
            ),
            StreamBuilder(
                stream:
                    getPeriodicStream(), // i is null here (check periodic docs)
                builder: (context, snapshot) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.add_circle_outline_sharp,
                            size: 35,
                            color: Colors.blue[600],
                          ),
                          title: const Text("Valve Size: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          trailing: SizedBox(
                            width: 35.w,
                            child: TextField(
                                enabled: !UtilsHandler.isCalibrationMode ||
                                    !UtilsHandler.isValveActive,
                                onChanged: (val) {},
                                controller: txtValveSize,
                                scrollPadding: EdgeInsets.symmetric(
                                    vertical: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom +
                                        5),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true, signed: false),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9.,]')),
                                ],
                                decoration: InputDecoration(
                                    hintText: UtilsHandler.isCalibrationMode
                                        ? "Calculating"
                                        : "Valve Size",
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7.0)),
                                        borderSide: BorderSide(
                                            color: Colors.black,
                                            style: BorderStyle.solid)))),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          endIndent: 10,
                          indent: 10,
                          color: Colors.black12,
                        ),
                        !UtilsHandler.isCalibrationMode
                            ? Container()
                            : const Text('Determining Nominal Valve Size',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                        SizedBox(height: 1.h),
                        Text(
                            'Number of Turns: ${UtilsHandler.angleModel.noOfTurns.toString()}',
                            style: const TextStyle(fontSize: 30)),
                        SizedBox(height: 3.h),
                        CustomPaint(
                          painter: _ArcPainter(),
                          child: Material(
                            shape: const CircleBorder(),
                            clipBehavior: Clip.antiAlias,
                            elevation: 4.0,
                            child: Container(
                              height: UtilsHandler.isCalibrationMode ? 250 : 50,
                              width: UtilsHandler.isCalibrationMode ? 250 : 50,
                              padding: const EdgeInsets.all(16.0),
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Transform.rotate(
                                angle: (double.parse(
                                        UtilsHandler.angleModel.angle!) *
                                    (math.pi / 180)),
                                child: Icon(
                                  weight: 0.1,
                                  Icons.arrow_downward,
                                  fill: 0,
                                  size:
                                      UtilsHandler.isCalibrationMode ? 125 : 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 3.h),
                        UtilsHandler.isCalibrationMode
                            ? Container()
                            : CircularPercentage(
                                currentPercentage:
                                    UtilsHandler.angleModel.noOfTurns ?? 0,
                                maxPercentage: txtValveSize.text.isEmpty
                                    ? 1
                                    : double.parse(txtValveSize.text),
                                size: 200,
                                duration: 2000,
                                percentageStrokeWidth: 10,
                                percentageColor: Colors.blue,
                                backgroundColor: Colors.black,
                                backgroundStrokeWidth: 2,
                                centerTextStyle: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 21,
                                ),
                                onCurrentValue: (currentValue) {
                                  print(
                                      "CircularPercentage currentValue: $currentValue");
                                },
                              ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
