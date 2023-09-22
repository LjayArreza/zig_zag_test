import 'package:get/get.dart';
import 'package:zig_zag_test/presentation/bindings/user_list.binding.dart';
import 'package:zig_zag_test/presentation/views/user_details_view.dart';
import 'package:zig_zag_test/presentation/views/user_list.view.dart';

part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.USER_LIST_SCREEN,
      page: () => const UserListView(),
      binding: UserListBinding(),
    ),
    GetPage(
      name: Routes.USER_DETAILS_SCREEN,
      page: () => const UserDetailsView(),
      binding: UserListBinding(),
    ),
  ];
}
