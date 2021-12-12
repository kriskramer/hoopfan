class AppUser {
  String displayName;
  final String email;
  String password;
  String favoriteTeam;

  AppUser({
    this.displayName,
    this.email,
    this.password,
    this.favoriteTeam,
  });

  Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "email": email,
        "favoriteTeam": favoriteTeam,
      };

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
        displayName: json["displayName"],
        email: json["email"],
        favoriteTeam: json["favoriteTeam"]);
  }
}
