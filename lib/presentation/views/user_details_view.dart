// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:zig_zag_test/app/config/color_constants.dart';
import 'package:zig_zag_test/app/core/base/base_view.dart';
import 'package:zig_zag_test/app/core/components/custom_appbar.dart';
import 'package:zig_zag_test/presentation/controllers/user_list.controller.dart';

class UserDetailsView extends BaseView<UserListController> {
  const UserDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ProgressHUD(
        inAsyncCall: controller.isLoading.value,
        key: UniqueKey(),
        child: SafeArea(
          child: Scaffold(
            appBar: CustomAppbar(
              isTitleCenter: true,
              backgroundColor: AppColors.darkGrayColor,
              elevation: 1,
              automaticallyImplyLeading: true,
              leadingIcon: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              appbarTitle: Text(
                '${controller.firstNameString} ${controller.lastNameString} Details',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          controller.avatarString.value,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '${controller.firstNameString.value} ${controller.lastNameString.value}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(controller.emailString.value),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
