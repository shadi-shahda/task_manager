
class LoginModel {
    int id;
    String username;
    String email;
    String firstName;
    String lastName;
    String gender;
    String image;
    String token;
    String refreshToken;
    String errorMessage;

    LoginModel({
        required this.id,
        required this.username,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.gender,
        required this.image,
        required this.token,
        required this.refreshToken,
        required this.errorMessage,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["id"]??0,
        username: json["username"]??'',
        email: json["email"]??'',
        firstName: json["firstName"]??'',
        lastName: json["lastName"]??'',
        gender: json["gender"]??'',
        image: json["image"]??'',
        token: json["token"]??'',
        refreshToken: json["refreshToken"]??'',
        errorMessage: json["errorMessage"]??'',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
        "token": token,
        "refreshToken": refreshToken,
    };
}
