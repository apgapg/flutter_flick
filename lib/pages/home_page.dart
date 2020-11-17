import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String eyesClosed = 'assets/images/s0.jpg';
  final String eyesOpen = 'assets/images/s1.jpg';
  final String eyesLeft = 'assets/images/sl.jpg';
  final String eyesRight = 'assets/images/sr.jpg';

  bool showEyesOpen = false;
  bool showEyesRight = false;
  bool showEyesLeft = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              GestureDetector(
                child: Image.asset(
                  eyesClosed,
                  fit: BoxFit.fill,
                ),
              ),
              Opacity(
                opacity: showEyesOpen ? 1.0 : 0.0,
                child: Image.asset(
                  eyesOpen,
                  fit: BoxFit.fill,
                ),
              ),
              Opacity(
                opacity: showEyesLeft ? 1.0 : 0.0,
                child: Image.asset(
                  eyesLeft,
                  fit: BoxFit.fill,
                ),
              ),
              Opacity(
                opacity: showEyesRight ? 1.0 : 0.0,
                child: Image.asset(
                  eyesRight,
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 3,
                    ),
                    onPanDown: (details) {
                      setState(() {
                        showEyesLeft = true;
                      });
                    },
                    onPanEnd: (details) {
                      setState(() {
                        showEyesLeft = false;
                      });
                    },
                    onPanCancel: () {
                      setState(() {
                        showEyesLeft = false;
                      });
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 3,
                    ),
                    onPanDown: (details) {
                      setState(() {
                        showEyesRight = true;
                      });
                    },
                    onPanEnd: (details) {
                      setState(() {
                        showEyesRight = false;
                      });
                    },
                    onPanCancel: () {
                      setState(() {
                        showEyesRight = false;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          onPanDown: (details) {
            setState(() {
              showEyesOpen = true;
            });
          },
          onPanEnd: (details) {
            setState(() {
              showEyesOpen = false;
            });
          },
          onPanCancel: () {
            setState(() {
              showEyesOpen = false;
            });
          },
        ),
      ),
    );
  }
}
