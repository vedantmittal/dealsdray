import 'dart:async';

import 'package:dealsdray/Login/verifyOTP.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_number/mobile_number.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  String _mobileNumber = '';
  List<SimCard> _simCard = <SimCard>[];
  bool val1 = false;
  bool val2 = false;

  @override
  void initState() {
    super.initState();
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {}
    });

    initMobileNumberState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    String mobileNumber = '';
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      mobileNumber = (await MobileNumber.mobileNumber)!;
      _simCard = (await MobileNumber.getSimCards)!;
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _mobileNumber = mobileNumber;
    });
  }

  Widget fillCards() {
    List<Widget> widgets = _simCard
        .map((SimCard sim) => GestureDetector(
              onTap: () {
                setState(() {
                  _mobileNumber = sim.number.toString();
                  if (0 == sim.slotIndex) {
                    val1 = !val1;
                    val2 = false;
                  }
                  if (1 == sim.slotIndex) {
                    val2 = !val2;
                    val1 = false;
                  }
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: (sim.slotIndex == 0)
                      ? val1
                          ? Colors.red[50]
                          : Colors.white
                      : val2
                          ? Colors.red[50]
                          : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${sim.number}',
                      style: TextStyle(
                          color: (sim.slotIndex == 0)
                              ? val1
                                  ? Colors.red
                                  : Colors.black
                              : val2
                                  ? Colors.red
                                  : Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    (sim.slotIndex == 0)
                        ? val1
                            ? Icon(
                                Icons.check,
                                color: Colors.red,
                                size: 24,
                              )
                            : SizedBox()
                        : val2
                            ? Icon(
                                Icons.check,
                                color: Colors.red,
                                size: 24,
                              )
                            : SizedBox()
                  ],
                ),
              ),
            ))
        .toList();
    return Column(children: widgets);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      height: 265,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Which number do you want\n to register with us",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          fillCards(),
          Spacer(),
          GestureDetector(
            onTap: () {
              if (val1 || val2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VerifyOtp(
                            val: _mobileNumber,
                          )),
                );
              } else {
                Navigator.pop(context);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.red),
              width: 90,
              height: 35,
              child: Center(
                child: Text(
                  "OK",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
