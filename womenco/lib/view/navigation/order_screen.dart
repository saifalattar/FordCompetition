import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/viewModel/cubit/bloc.dart';
import 'package:womenco/viewModel/cubit/states.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(),
        context: context, designSize: Size(414, 896));

    return BlocConsumer<WomenCoCubit, WomenCoStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Container(
          width: double.infinity.w,
          padding: EdgeInsets.fromLTRB(35, 100, 35, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upcoming",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Avenir",
                  )),
              SizedBox(
                height: 20.h,
              ),
              Card(
                child: WomenCoCubit.GET(context).allOrders.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("You have no upcoming orders"),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: WomenCoCubit.GET(context)
                            .allOrders[0]
                            .orderWidget(),
                      ),
              ),
              SizedBox(
                height: 100.h,
              ),
              Text("Past",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Avenir",
                  )),
              SizedBox(height: 32.h),
              WomenCoCubit.GET(context).allOrders.last.orderWidget(),
              SizedBox(
                height: 100.h,
              ),
              Text("History",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Avenir",
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.history),
                  Text("See all past orders",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18,
                        fontFamily: "Avenir",
                      )),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.navigate_next_sharp))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

//  Container(
//                     width: 328.w,
//                     height: 75.h,
//                     child: Order(
//                             type: orderTypes.Cleaning,
//                             status: orderStatus.Completed,
//                             address: "sas",
//                             time: DateTime.now(),
//                             price: 65656)
//                         .orderWidget(),
//                   )
