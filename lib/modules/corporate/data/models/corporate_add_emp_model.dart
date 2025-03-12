class CorporateAddEmpModel {
  final bool? status;
  final String? message;
  final Data? data;

  CorporateAddEmpModel({
    this.status,
    this.message,
    this.data,
  });

  CorporateAddEmpModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.toJson()
  };
}

class Data {
  final String? name;
  final String? email;
  final String? about;
  final String? ssNumber;
  final String? phoneNo;
  final int? addressId;
  final int? roleId;
  final String? parentId;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

  Data({
    this.name,
    this.email,
    this.about,
    this.ssNumber,
    this.phoneNo,
    this.addressId,
    this.roleId,
    this.parentId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  Data.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        email = json['email'] as String?,
        about = json['about'] as String?,
        ssNumber = json['ss_number'] as String?,
        phoneNo = json['phone_no'] as String?,
        addressId = json['address_id'] as int?,
        roleId = json['role_id'] as int?,
        parentId = json['parent_id'] as String?,
        updatedAt = json['updated_at'] as String?,
        createdAt = json['created_at'] as String?,
        id = json['id'] as int?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'email' : email,
    'about' : about,
    'ss_number' : ssNumber,
    'phone_no' : phoneNo,
    'address_id' : addressId,
    'role_id' : roleId,
    'parent_id' : parentId,
    'updated_at' : updatedAt,
    'created_at' : createdAt,
    'id' : id
  };
}