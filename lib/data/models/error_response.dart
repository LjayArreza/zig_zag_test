// ignore_for_file: no_leading_underscores_for_local_identifiers

class Error400ResponseModel {
  Error400ResponseModel({
    required this.error,
  });
  late final String error;

  Error400ResponseModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['error'] = error;
    return _data;
  }
}
