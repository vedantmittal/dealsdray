import 'package:dealsdray/Login/selectDetail.dart';
import 'package:dealsdray/Login/selectNumber.dart';
import 'package:flutter/material.dart';

class SelectOption extends StatelessWidget {
  const SelectOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/backgroundl.png"),
                fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogIn()),
                  );
                },
                child: Center(
                  child: Text(
                    "REGISTER",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 28,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogIn()),
                  );
                },
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 28,
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: 120,
              )
            ],
          ),
        ),
      ),
    );
  }
}
