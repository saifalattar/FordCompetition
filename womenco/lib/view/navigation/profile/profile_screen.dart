import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/viewModel/cubit/bloc.dart';
import 'package:womenco/viewModel/cubit/states.dart';
import 'package:womenco/view/navigation/profile/editProfile.dart';
import 'package:womenco/shared/component/components.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(),
        context: context, designSize: Size(414, 896));

    return BlocConsumer<WomenCoCubit, WomenCoStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Center(
                    child: Text(
                  "My Profile",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
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
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
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
                Divider(),
                Text(
                  "Settings",
                  style: TextStyle(
                      fontSize: 17, color: Colors.grey, fontFamily: "Avenir"),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      settingsButton(
                          title: "Language",
                          icon: Icons.language,
                          onPressed: () {}),
                      settingsButton(
                          title: "Help", icon: Icons.help, onPressed: () {}),
                      settingsButton(
                          title: "Contact Us",
                          icon: Icons.call,
                          onPressed: () {}),
                      settingsButton(
                          title: "Sign Out",
                          icon: Icons.logout,
                          onPressed: () {}),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
