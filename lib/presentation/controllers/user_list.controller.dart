// ignore_for_file: invalid_use_of_protected_member

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:zig_zag_test/app/core/base/base_controller.dart';
import 'package:zig_zag_test/data/models/user_list_response.dart';
import 'package:zig_zag_test/domain/repository/user_list_repository.dart';

class UserListController extends BaseController {
  var isLoading = false.obs;

  var userData = [].obs;
  var firstNameList = [''].obs;
  var lastNameList = [''].obs;
  var avatarList = [''].obs;
  var emailList = [''].obs;

  var firstNameString = ''.obs;
  var lastNameString = ''.obs;
  var avatarString = ''.obs;
  var emailString = ''.obs;

  @override
  void onInit() {
    getUserList();
    super.onInit();
  }

  UserListRepository userListRepo;
  UserListController(this.userListRepo);

  Future<void> getUserList() async {
    isLoading.value = true;
    var response = await userListRepo.userList();
    if (response is UserListResponse) {
      isLoading(false);
      userData.value = response.data!;
      firstNameList.value = [];
      lastNameList.value = [];
      avatarList.value = [];
      emailList.value = [];
      for (var user in userData) {
        firstNameList.value.add(user.firstName ?? '');
        lastNameList.value.add(user.lastName ?? '');
        avatarList.value.add(user.avatar ?? '');
        emailList.value.add(user.email ?? '');
      }
    } else {
      Fluttertoast.showToast(
        msg: 'Error fetching users',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
      );
    }
  }
}
