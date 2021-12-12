import 'dart:convert';

class AppUser {
  String id;
  String displayName;
  final String email;
  String password;
  String favoriteTeam;

  AppUser({
    this.id,
    this.displayName,
    this.email,
    this.password,
    this.favoriteTeam,
  });

  Map<String, dynamic> toJson({String id}) => {
        "id": id,
        "displayName": displayName,
        "email": email,
        "favoriteTeam": favoriteTeam,
      };

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
        id: json["id"],
        displayName: json["displayName"],
        email: json["email"],
        favoriteTeam: json["favoriteTeam"]);
  }
}
