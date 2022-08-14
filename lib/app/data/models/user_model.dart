//User Model
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String?  uid;
  String?  email;
  String?  displayName;
  String?  photoURL;
  String?  lastSignInTime;
  Timestamp?  createdAt;
  List<dynamic>?  favorite;
  UserModel(
      {this.uid, this.email, this.displayName, this.photoURL, this.favorite,this.createdAt,this.lastSignInTime});

  factory UserModel.fromMap(Map data) {
    return UserModel(
        uid: data['uid'] ,
        email: data['email'] ?? "",
        displayName: data['displayName'] ?? "",
        photoURL: data['photoURL'] ?? "",
        favorite: data['favorite'] ?? [],
        createdAt: data['createdAt'] ?? "",
        lastSignInTime:data['lastSignInTime']??'');
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "displayName": displayName,
        "photoURL": photoURL,
        "createdAt": createdAt,
        "lastSignInTime":lastSignInTime
      };
}
