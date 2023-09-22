// ignore_for_file: prefer_const_constructors, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:zig_zag_test/app/config/color_constants.dart';
import 'package:zig_zag_test/app/core/base/base_view.dart';
import 'package:zig_zag_test/app/core/components/custom_appbar.dart';
import 'package:zig_zag_test/app/core/routes/app_pages.dart';
import 'package:zig_zag_test/presentation/controllers/user_list.controller.dart';

class UserListView extends BaseView<UserListController> {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return ProgressHUD(
          inAsyncCall: controller.isLoading.value,
          key: UniqueKey(),
          opacity: 0.3,
          child: SafeArea(
            child: Scaffold(
              appBar: CustomAppbar(
                isTitleCenter: true,
                backgroundColor: AppColors.darkGrayColor,
                elevation: 1,
                automaticallyImplyLeading: false,
                appbarTitle: Text(
                  'List of users',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: Column(
                children: [
                  SizedBox(height: 30),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.userData.value.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () async {
                          controller.firstNameString.value =
                              controller.firstNameList.value[index];
                          controller.lastNameString.value =
                              controller.lastNameList[index];
                          controller.emailString.value =
                              controller.emailList.value[index];
                          controller.avatarString.value =
                              controller.avatarList.value[index];
                          Get.toNamed(Routes.USER_DETAILS_SCREEN);
                        },
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            controller.avatarList.value[index],
                          ),
                        ),
                        title: Text(
                          '${controller.firstNameList.value[index]} ${controller.lastNameList.value[index]}',
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
