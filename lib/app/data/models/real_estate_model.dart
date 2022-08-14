class RealEstateModel {
  String ?id;
  String? address;
  Map<String, dynamic>? createat;
  String?  district;
  int?  propertysize;
  String?  landmark;
  List<dynamic>?  nearbyplaces;
  int?  numberofbathrooms;
  int?  numberofbedrooms;
  int?  numberoffloors;
  int?  numberofparkingspace;
  int?  yearofconstruction;
  String?  building;
  List<dynamic>?  centralservice;
  String?  detail;
  String?  email;
  String?  firstimg;
  List<dynamic>?  furniture;
  int?  idtype;
  double?  latitude;
  double?  longitude;
  String?  name;
  int?  price;
  String?  projectname;
  String?  province;
  int?  sizefamily;
  int?  status;
  String?  subDistrict;
  List<dynamic>?  urlimginside;
  List<dynamic>?  urlimgoutside;
  String?  zipcode;
  RealEstateModel({
    this.id,
    this.address,
    this.createat,
    this.district,
    this.propertysize,
    this.landmark,
    this.nearbyplaces,
    this.numberofbathrooms,
    this.numberofbedrooms,
    this.numberoffloors,
    this.numberofparkingspace,
    this.yearofconstruction,
    this.building,
    this.centralservice,
    this.detail,
    this.email,
    this.firstimg,
    this.furniture,
    this.idtype,
    this.latitude,
    this.longitude,
    this.name,
    this.price,
    this.projectname,
    this.province,
    this.sizefamily,
    this.status,
    this.subDistrict,
    this.urlimginside,
    this.urlimgoutside,
    this.zipcode,
  });

  // UserModel({this.uid, this.email, this.displayName, this.photoURL});

  // factory UserModel.fromMap(Map data) {
  //   return UserModel(
  //     uid: data['uid'],
  //     email: data['email'] ?? '',
  //     displayName: data['displayName'] ?? '',
  //     photoURL: data['photoURL'] ?? '',
  //   );
  // }

  // Map<String, dynamic> toJson() =>
  //     {"uid": uid, "email": email, "displayName": displayName, "photoURL": photoURL};

  factory RealEstateModel.fromJson(Map<String, dynamic> json) {
    return new RealEstateModel(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        firstimg: json["firstimg"] ?? '',
        price: json["price"] ?? 0,
        address: json["address"] ?? '',
        createat: json["Createat"],
        district: json["district"],
        propertysize: json["propertysize"],
        landmark: json["landmark"],
        nearbyplaces: json["Nearbyplaces"],
        numberofbathrooms: json["numberofbathrooms"],
        numberofbedrooms: json["numberofbedrooms"],
        numberoffloors: json["numberoffloors"],
        numberofparkingspace: json["numberofparkingspace"],
        yearofconstruction: json["yearofconstruction"],
        building: json["building"],
        centralservice: json["centralservice"],
        detail: json["detail"],
        email: json["email"],
        furniture: json["furniture"],
        idtype: json["idtype"] ?? 0,
        latitude: json["latitude"] ?? 0,
        longitude: json["longitude"] ?? 0,
        projectname: json["projectname"],
        province: json["province"] ?? '',
        sizefamily: json["sizefamily"] ?? 0,
        status: json["status"] ?? 0,
        subDistrict: json["subDistrict"],
        urlimginside: json["urlimginside"],
        urlimgoutside: json["urlimgoutside"],
        zipcode: json["zipCode"] ?? '');
  }
}
