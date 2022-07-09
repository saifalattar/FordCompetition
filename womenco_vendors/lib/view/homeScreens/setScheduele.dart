import 'package:day_picker/day_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:womenco_vendors/shared/colors.dart';
import 'package:womenco_vendors/shared/component/components.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';
import 'package:womenco_vendors/viewModel/cubit/states.dart';

class SetSchedule extends StatefulWidget {
  const SetSchedule({Key? key}) : super(key: key);

  @override
  State<SetSchedule> createState() => _SetScheduleState();
}

class _SetScheduleState extends State<SetSchedule> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(414, 896));
    return BlocConsumer<WomenCoCubitVendors, WomenCoStatesVendors>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = WomenCoCubitVendors.GET(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Set Schedule",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Hours",
                          style: TextStyle(fontSize: 25),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(buttonColor1)),
                            onPressed: () async {
                              TimeRange time = await showTimeRangePicker(
                                  context: context,
                                  paintingStyle: PaintingStyle.stroke,
                                  strokeColor: buttonColor1,
                                  handlerColor: buttonColor1,
                                  use24HourFormat: false);
                              setState(() {
                                cubit.hours =
                                    "${time.startTime.format(context)} - ${time.endTime.format(context)}";
                              });
                            },
                            child: Text("${cubit.hours}"))
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Days from",
                          style: TextStyle(fontSize: 25),
                        ),
                        DropdownButton<String>(
                            items: weekDays,
                            value: cubit.daysFrom,
                            onChanged: (val) {
                              setState(() {
                                cubit.daysFrom = val;
                              });
                            }),
                        Text("to", style: TextStyle(fontSize: 25)),
                        DropdownButton<String>(
                            items: weekDays,
                            value: cubit.daysTo,
                            onChanged: (val) {
                              setState(() {
                                cubit.daysTo = val;
                              });
                            })
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Places", style: TextStyle(fontSize: 25)),
                        DropdownButton<String>(
                            items: places,
                            value: cubit.area,
                            onChanged: (val) {
                              setState(() {
                                cubit.area = val;
                              });
                            })
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Hourly Rate", style: TextStyle(fontSize: 22)),
                        Container(
                          width: 60,
                          child: TextField(
                            controller: cubit.hourlyRate,
                            decoration: InputDecoration(
                                labelStyle: TextStyle(color: buttonColor1),
                                labelText: "Amount",
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: buttonColor1))),
                          ),
                        ),
                        Text("EGP / Hour")
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    WomenCoButton(context, title: "Done", onPressed: () {
                      cubit.fullSchedule = {
                        "Hours": cubit.hours,
                        "Days": {"from": cubit.daysFrom, "To": cubit.daysTo},
                        "Area": cubit.area,
                        "Hourly Rate": cubit.hourlyRate.text
                      };
                      print(cubit.fullSchedule);
                    }, color: buttonColor1)
                  ],
                ),
              ),
            ),
          );
        });
  }
}
