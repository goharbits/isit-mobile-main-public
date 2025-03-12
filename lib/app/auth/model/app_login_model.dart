class AppLoginModel {
  final bool? status;
  final String? message;
  final Data? data;

  AppLoginModel({
    this.status,
    this.message,
    this.data,
  });

  AppLoginModel.fromJson(Map<String, dynamic> json)
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
  final int? id;
  final String? name;
  final String? email;
  final int? roleId;
  final dynamic emailVerifiedAt;
  final dynamic ssNumber;
  final String? about;
  final String? phoneNo;
  final int? einNumber;
  final String? status;
  final dynamic addressId;
  final String? createdAt;
  final String? updatedAt;
  final int? parentId;
  final String? taxIdNumber;
  final String? registrationNumber;
  final String? workPermitId;
  final Role? role;
  final List<Images>? images;
  final String? token;

  Data({
    this.id,
    this.name,
    this.email,
    this.roleId,
    this.emailVerifiedAt,
    this.ssNumber,
    this.about,
    this.phoneNo,
    this.einNumber,
    this.status,
    this.addressId,
    this.createdAt,
    this.updatedAt,
    this.parentId,
    this.taxIdNumber,
    this.registrationNumber,
    this.workPermitId,
    this.role,
    this.images,
    this.token,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        email = json['email'] as String?,
        roleId = json['role_id'] as int?,
        emailVerifiedAt = json['email_verified_at'],
        ssNumber = json['ss_number'],
        about = json['about'] as String?,
        phoneNo = json['phone_no'] as String?,
        einNumber = json['ein_number'] as int?,
        status = json['status'] as String?,
        addressId = json['address_id'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        parentId = json['parent_id'] as int?,
        taxIdNumber = json['tax_id_number'] as String?,
        registrationNumber = json['registration_number'] as String?,
        workPermitId = json['work_permit_id'] as String?,
        role = (json['role'] as Map<String,dynamic>?) != null ? Role.fromJson(json['role'] as Map<String,dynamic>) : null,
        images = (json['images'] as List?)?.map((dynamic e) => Images.fromJson(e as Map<String,dynamic>)).toList(),
        token = json['token'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'email' : email,
    'role_id' : roleId,
    'email_verified_at' : emailVerifiedAt,
    'ss_number' : ssNumber,
    'about' : about,
    'phone_no' : phoneNo,
    'ein_number' : einNumber,
    'status' : status,
    'address_id' : addressId,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'parent_id' : parentId,
    'tax_id_number' : taxIdNumber,
    'registration_number' : registrationNumber,
    'work_permit_id' : workPermitId,
    'role' : role?.toJson(),
    'images' : images?.map((e) => e.toJson()).toList(),
    'token' : token
  };
}

class Role {
  final int? id;
  final String? name;

  Role({
    this.id,
    this.name,
  });

  Role.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name
  };
}

class Images {
  final int? id;
  final String? path;
  final String? type;
  final String? imageableType;
  final int? imageableId;
  final String? createdAt;
  final String? updatedAt;

  Images({
    this.id,
    this.path,
    this.type,
    this.imageableType,
    this.imageableId,
    this.createdAt,
    this.updatedAt,
  });

  Images.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        path = json['path'] as String?,
        type = json['type'] as String?,
        imageableType = json['imageable_type'] as String?,
        imageableId = json['imageable_id'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'path' : path,
    'type' : type,
    'imageable_type' : imageableType,
    'imageable_id' : imageableId,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}