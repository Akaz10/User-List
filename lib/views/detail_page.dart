import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DetailPage extends StatelessWidget {
  DetailPage({required this.avatar, required this.name,required this.surname,required this.userInfo, Key? key}) : super(key: key);
  String avatar,name,surname,userInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User Detail'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(color: Colors.white,height: 20.h,),
                Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30.sp),topRight: Radius.circular(30.sp))
                  ),
                ),
              ],
            ),
            Positioned.fill(
              top: 10.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: Image.network(
                          avatar,
                          fit: BoxFit.cover,
                        ).image,
                        backgroundColor: Colors.black,
                        radius: 60.sp, ),
                      SizedBox(height: 3.h,),
                      Text(name,style: TextStyle(fontSize: 15.sp,color: Colors.white),),
                      Text(surname,style: TextStyle(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.w600)),
                      SizedBox(height: 3.h,),
                      Text(userInfo,style: TextStyle(fontSize: 12.sp,color: Colors.white),),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
