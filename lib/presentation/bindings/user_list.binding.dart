import 'package:get/get.dart';
import 'package:zig_zag_test/app/core/base/base_binding.dart';
import 'package:zig_zag_test/domain/repository/user_list_repository.dart';
import 'package:zig_zag_test/presentation/controllers/user_list.controller.dart';

class UserListBinding implements BaseBinding {
  @override
  void dependencies() {
    Get.lazyPut<UserListController>(
        () => UserListController(UserListRepository()));
  }
}
