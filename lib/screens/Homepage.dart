import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planet_app/screens/global.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    );
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          title: Text(
            "Planets",
            style: TextStyle(
              letterSpacing: 1,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff330066),
        ),
        backgroundColor: Color(0xff4b0082),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: Global.planets
                  .map((e) => GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed("detail_page", arguments: e);
                        },
                        child: Stack(children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              bottom: 20,
                              left: 60,
                              right: 20,
                            ),
                            child: Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff330066).withOpacity(0.8)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 310,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, top: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                child: Text(
                                                  e['name'],
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                width: 200,
                                              ),
                                              Icon(
                                                Icons.menu,
                                                color: Colors.white54,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                child: Text(
                                                  e["Galaxy"],
                                                  style: TextStyle(
                                                      color: Colors.white54,
                                                      fontSize: 15),
                                                ),
                                                width: 120,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 200),
                                            child: Container(
                                              alignment: Alignment.topLeft,
                                              height: 3,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  color: Colors.blueAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.white54,
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                e["distance"],
                                                style: TextStyle(
                                                    color: Colors.white54),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Icon(
                                                Icons.speed,
                                                color: Colors.white54,
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                e["gravity"],
                                                style: TextStyle(
                                                    color: Colors.white54),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 7),
                            alignment: Alignment.centerLeft,
                            height: 190,
                            width: double.infinity,
                            child: Container(
                              height: 100,
                              alignment: Alignment.centerLeft,
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
                        ]),
                      ))
                  .toList(),
            ),
          ),
        ));
  }
}
