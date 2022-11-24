import 'package:flutter/material.dart';
import 'package:planet_app/screens/global.dart';

class Details_page extends StatefulWidget {
  const Details_page({Key? key}) : super(key: key);

  @override
  State<Details_page> createState() => _Details_pageState();
}

class _Details_pageState extends State<Details_page>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    );
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    dynamic e = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.deepPurple,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.network(
                    e["picture"],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(top: 110, left: 20),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Overview",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white70,
                                  letterSpacing: 5,
                                  fontWeight: FontWeight.bold,
                                  inherit: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 265),
                          child: Container(
                            height: 3,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 240,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              e["description"],
                              style: TextStyle(
                                fontSize: 20,
                                inherit: false,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30),
                              ),
                            ),
                            backgroundColor: Color(0xff130027),
                            builder: (context) => Container(
                              width: double.infinity,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(40),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                          "Welcome to " + e["name"],
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Container(
                                          height: 150,
                                          width: 150,
                                          child: AnimatedBuilder(
                                            animation: animationController,
                                            builder: (context, widget) {
                                              return RotationTransition(
                                                turns: animationController,
                                                child: widget,
                                              );
                                            },
                                            child: Image.network(
                                              e['image'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.white54,
                                      ),
                                      Text(
                                        "Distance To Earth :-",
                                        style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        e["distoearth"],
                                        style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      },
                      child: Container(
                          height: 220,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff330066)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 75),
                                    child: Text(
                                      e["name"],
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    e["Galaxy"],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white54,
                                        wordSpacing: 5,
                                        letterSpacing: 1),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    height: 3,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white54,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    e["distance"],
                                    style: TextStyle(
                                        color: Colors.white54, fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.speed,
                                    color: Colors.white54,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    e["gravity"],
                                    style: TextStyle(
                                        color: Colors.white54, fontSize: 20),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 230),
                        child: Container(
                          height: 150,
                          width: 150,
                          child: Hero(
                            tag: e["name"],
                            child: AnimatedBuilder(
                              animation: animationController,
                              builder: (context, widget) {
                                return RotationTransition(
                                  turns: animationController,
                                  child: widget,
                                );
                              },
                              child: Image.network(
                                e['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ]),
            ],
          )
        ],
      ),
    );
  }
}
