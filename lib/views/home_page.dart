import 'package:flutter/material.dart';
import 'package:flutterapp01/controllers/user_controller.dart';
import 'package:flutterapp01/views/detail_page.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(UserController(), permanent: true); //PERMANENT TRUE OLMASI SAYFAYI YIKMAZ TEKRARDAN YÜKLEMEMEMİZİ SAĞLAR VE KALDIĞIMIZ YERDEN DEVAM EDEBİLİRİZ
    var controller = Get.find<UserController>();     // KEY VERİLEN YÖNTEMLE YAPILANINIDA BİLİYORUM ANCAK BUNU KULLANMAYI TERCİH ETTİM
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Users'),
        backgroundColor: Colors.red,
      ),
      body: Obx(() => controller.isLoading.value
      ? Center(child: CircularProgressIndicator(color: Colors.red,),
      )
          : SafeArea(
          child: SingleChildScrollView(
            child:ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: controller.userList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.sp)),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 2.h),
                                tileColor: Colors.red,
                                leading: CircleAvatar(
                                  backgroundImage: Image.network(
                                    controller.userList[index].avatar
                                        .toString(),
                                    fit: BoxFit.cover,
                                  ).image,
                                  radius: 30.sp,
                                  backgroundColor: Colors.white,
                                ),
                                title: Text(
                                  '${controller.userList[index].name} ${controller.userList[index].surname}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  '${controller.userList[index].email} ${controller.userList[index].phone}',
                                  style: TextStyle(color: Colors.white70),
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      Get.to(DetailPage(  //API'DAN ÇEKTİĞİMİZ VERİLERİ DETAY SAYFASINA GÖNDERİYORUZ, TEKRARDAN GET İŞLEMİ YAPMADAN
                                        avatar: controller.userList[index].avatar.toString(),
                                        name: controller.userList[index].name.toString(),
                                        surname: controller.userList[index].surname.toString(),
                                        userInfo: controller.userList[index].userInfo.toString(),
                                      ));
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 20.sp,
                                    )),
                              ));
                        }),
              ))),
    );
  }
}
