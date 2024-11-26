class UserProfileModel {
  bool? status;
  String? message;
  UserDataModel? data;

  UserProfileModel({this.status, this.message, this.data});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
  
    status = json['status'];
    message = json['message'];
    data = UserDataModel.fromJson(json['data']);
  }


}

class UserDataModel {
  String? id;
  String? name;
  String? email;
  String? mobileNumber;
  String? password;
  String? image;
  bool? status;
  String? createdAt;
  String? updatedAt;

  UserDataModel(
      {this.id,
        this.name,
        this.email,
        this.mobileNumber,
        this.password,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    password = json['password'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}
