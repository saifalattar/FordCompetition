import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/Cubit/bloc.dart';
import 'package:womenco/Cubit/states.dart';
import 'package:womenco/shared/component/components.dart';

class CleaningPage extends StatefulWidget {
  const CleaningPage({Key? key}) : super(key: key);

  @override
  State<CleaningPage> createState() => _CleaningPageState();
}

class _CleaningPageState extends State<CleaningPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(),
        context: context, designSize: Size(414, 896));
    return BlocProvider(
      create: (context) => WomenCoCubit(),
      child: BlocConsumer<WomenCoCubit, WomenCoStates>(
          builder: (context, states) {
            return Scaffold(
              backgroundColor: Colors.blue[300],
              body: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/cleaning.png"),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 414.w,
                    height: 673.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(50))),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Center(
                              child: Text(
                                "Cleaning",
                                style: TextStyle(
                                    color: Colors.blue[300],
                                    fontFamily: "Avenir",
                                    fontSize: 37),
                              ),
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.blue[300],
                                      child: Icon(
                                        Icons.monetization_on_outlined,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text("Salary",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Text("150/hr",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.blue[300],
                                      child: Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text("Workers",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Text("71",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.blue[300],
                                      child: Icon(
                                        Icons.access_time,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text("Time",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Text("4 hr",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )
                              ]),
                          SizedBox(
                            height: 45.h,
                          ),
                          Text(
                            "Description",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                size: 18,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                """Vacuuming, sweeping, and mopping floors of 
various types.""",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                size: 18,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                """Dusting ceilings, light fittings, countertops,
and loose furniture.""",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                maxLines: 3,
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                size: 18,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                """Scrubbing and sanitizing toilets, sinks,
and kitchen fixtures.""",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                size: 18,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                """Liaising with the line manager to ensure that you 
have sufficient cleaning products at all times.""",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                size: 18,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                """Washing and drying windows.""",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: WomenCoButton(
                                title: "Book Now",
                                onPressed: () {},
                                color: Colors.blue[200]),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          listener: (context, states) {}),
    );
  }
}
