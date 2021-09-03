import 'package:dealsdray/Home/homePage.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class EditMobilePopup extends StatefulWidget {
  const EditMobilePopup({Key? key}) : super(key: key);

  @override
  _EditMobilePopupState createState() => _EditMobilePopupState();
}

class _EditMobilePopupState extends State<EditMobilePopup> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode _first = FocusNode();
  final FocusNode _second = FocusNode();
  final FocusNode _third = FocusNode();
  final FocusNode _fourth = FocusNode();

  String phone = '';
  String otp = '';
  String? sessionId;
  String f1 = '';
  String f2 = '';
  String f3 = '';
  String f4 = '';
  bool otpSent = false;
  bool verifyOTP = false;

  @override
  void initState() {
    _first.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OTPFields(
            onChange: (value) {
              f1 = value[0];
              _second.requestFocus();
            },
            focus: _first,
          ),
          OTPFields(
            onChange: (value) {
              f2 = value[0];
              _third.requestFocus();
            },
            focus: _second,
          ),
          OTPFields(
            onChange: (value) {
              f3 = value[0];
              _fourth.requestFocus();
            },
            focus: _third,
          ),
          OTPFields(
            onChange: (value) {
              f4 = value[0];
              FocusScope.of(context).unfocus();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            focus: _fourth,
          ),
        ],
      ),
    );
  }
}

class OTPFields extends StatelessWidget {
  const OTPFields({Key? key, required this.onChange, required this.focus})
      : super(key: key);

  final FocusNode focus;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      height: 55,
      child: TextFormField(
        focusNode: focus,
        onChanged: (value) {
          if (value.isNotEmpty) {
            onChange(value);
          }
        },
        textAlignVertical: TextAlignVertical.top,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          contentPadding: EdgeInsets.zero,
        ),
        keyboardType: TextInputType.number,
        style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black45),
      ),
    );
  }
}

class OtpTimer extends StatefulWidget {
  final int timerMaxSeconds;

  const OtpTimer({Key? key, required this.timerMaxSeconds}) : super(key: key);

  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  final interval = const Duration(seconds: 1);

  int currentSeconds = 0;

  late Timer _timer;

  String get timerText =>
      // ignore: lines_longer_than_80_chars
      '${(((widget.timerMaxSeconds - currentSeconds) ~/ 60) % 60).toString().padLeft(2, '0')}:${((widget.timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  void startTimeout() {
    final duration = interval;
    _timer = Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick >= widget.timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      timerText,
      style: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
    );
  }
}
