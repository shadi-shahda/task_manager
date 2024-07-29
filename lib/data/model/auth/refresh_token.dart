
class RefreshTokenModel {
  String token;
  String refreshToken;
  String errorMessage;

  RefreshTokenModel({
    required this.token,
    required this.refreshToken,
    required this.errorMessage,
  });

  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) => RefreshTokenModel(
    token: json["token"]??'',
    refreshToken: json["refreshToken"]??'',
    errorMessage: json["errorMessage"]??','
  );


}
