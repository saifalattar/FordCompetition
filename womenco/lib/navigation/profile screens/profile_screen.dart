import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/Cubit/bloc.dart';
import 'package:womenco/Cubit/states.dart';
import 'package:womenco/navigation/profile%20screens/editProfile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(),
        context: context, designSize: Size(414, 896));

    return BlocProvider(
      create: (context) => WomenCoCubit(),
      child: BlocConsumer<WomenCoCubit, WomenCoStates>(
          builder: (context, states) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(
                    child: Text(
                  "My Profile",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
              ),
              body: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 26.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 60.r,
                                backgroundImage: NetworkImage(
                                  //to add the user picture type
                                  //WomenCoCubit.GET(context).user.profileImageURL
                                  "https://www.blexar.com/avatar.png",
                                ),
                              ),
                              SizedBox(
                                width: 17.w,
                              ),
                              Column(
                                children: [
                                  Text(
                                    WomenCoCubit.GET(context).user.Name,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "User",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  )
                                ],
                              ),
                            ]),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfile()));
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (context, states) {}),
    );
  }
}
