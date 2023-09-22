import 'package:logger/logger.dart';
import 'package:zig_zag_test/app/core/services/api/api_endpoint.dart';
import 'package:zig_zag_test/app/core/services/api/api_method.dart';
import 'package:zig_zag_test/app/core/services/dio_service.dart';
import 'package:zig_zag_test/data/models/error_response.dart';
import 'package:zig_zag_test/data/models/user_list_response.dart';

class UserListRepository {
  DioHttpService httpService = DioHttpService();
  final logger = Logger();
  UserListRepository();

  Future<dynamic> userList() async {
    httpService.init();
    try {
      var response = await httpService.request(
        url: APIEndpoint.USER_LIST,
        method: ApiMethod.GET,
      );

      if (response.statusCode == 200) {
        return UserListResponse.fromJson(response.data);
      } else {
        return Error400ResponseModel.fromJson(response.data);
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
