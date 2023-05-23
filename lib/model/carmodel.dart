// class Cardetails {
//   bool? success;
//   int? code;
//   String? message;
//   Data? data;
//   Null? type;

//   Cardetails({this.success, this.code, this.message, this.data, this.type});

//   Cardetails.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     code = json['code'];
//     message = json['message'];
//     data = json['data'] != null ?  Data.fromJson(json['data']) : null;
//     type = json['type'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     data['code'] = this.code;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['type'] = this.type;
//     return data;
//   }
// }

// class Data {
//   List<Cars>? cars;
//   List<Drivers>? drivers;

//   Data({this.cars, this.drivers});

//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['cars'] != null) {
//       cars = <Cars>[];
//       json['cars'].forEach((v) {
//         cars!.add(new Cars.fromJson(v));
//       });
//     }
//     if (json['drivers'] != null) {
//       drivers = <Drivers>[];
//       json['drivers'].forEach((v) {
//         drivers!.add(new Drivers.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.cars != null) {
//       data['cars'] = this.cars!.map((v) => v.toJson()).toList();
//     }
//     if (this.drivers != null) {
//       data['drivers'] = this.drivers!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Cars {
//   int? id;
//   int? companyUserId;
//   String? name;
//   String? image;
//   String? carLicensePlateNumber;
//   int? expireIn;

//   Cars(
//       {this.id,
//       this.companyUserId,
//       this.name,
//       this.image,
//       this.carLicensePlateNumber,
//       this.expireIn});

//   Cars.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     companyUserId = json['company_user_id'];
//     name = json['name'];
//     image = json['image'];
//     carLicensePlateNumber = json['car_license_plate_number'];
//     expireIn = json['expire_in'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['company_user_id'] = this.companyUserId;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     data['car_license_plate_number'] = this.carLicensePlateNumber;
//     data['expire_in'] = this.expireIn;
//     return data;
//   }
// }

// class Drivers {
//   int? id;
//   String? name;
//   String? image;
//   Null? userRole;

//   Drivers({this.id, this.name, this.image, this.userRole});

//   Drivers.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//     userRole = json['user_role'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     data['user_role'] = this.userRole;
//     return data;
//   }
// }