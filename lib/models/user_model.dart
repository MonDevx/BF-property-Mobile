//User Model
class UserModel {
  String uid;
  String email;
  String displayName;
  String photoURL;
  List<dynamic> favorite;
  UserModel(
      {this.uid, this.email, this.displayName, this.photoURL, this.favorite});

  factory UserModel.fromMap(Map data) {
    return UserModel(
        uid: data['uid'],
        email: data['email'] ?? "",
        displayName: data['displayName'] ?? "",
        photoURL: data['photoURL'] ?? "",
        favorite: data['favorite'] ?? []);
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "displayName": displayName,
        "photoURL": photoURL
      };
}
