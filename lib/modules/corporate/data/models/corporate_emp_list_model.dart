class CorporateEmpListModel {
  final bool? status;
  final String? message;
  final List<DataEmpList>? data;

  CorporateEmpListModel({
    this.status,
    this.message,
    this.data,
  });

  CorporateEmpListModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => DataEmpList.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class DataEmpList {
  final int? id;
  final String? name;
  final String? email;
  final int? roleId;
  final dynamic emailVerifiedAt;
  final int? ssNumber;
  final String? about;
  final String? phoneNo;
  final dynamic einNumber;
  final String? status;
  final int? addressId;
  final String? createdAt;
  final String? updatedAt;
  final int? parentId;
  final dynamic taxIdNumber;
  final dynamic registrationNumber;
  final dynamic workPermitId;
  final Address? address;
  final Role? role;
  final Corporate? corporate;
  final List<Images>? images;
  final List<dynamic>? services;

  DataEmpList({
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
    this.address,
    this.role,
    this.corporate,
    this.images,
    this.services,
  });

  DataEmpList.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        email = json['email'] as String?,
        roleId = json['role_id'] as int?,
        emailVerifiedAt = json['email_verified_at'],
        ssNumber = json['ss_number'] as int?,
        about = json['about'] as String?,
        phoneNo = json['phone_no'] as String?,
        einNumber = json['ein_number'],
        status = json['status'] as String?,
        addressId = json['address_id'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        parentId = json['parent_id'] as int?,
        taxIdNumber = json['tax_id_number'],
        registrationNumber = json['registration_number'],
        workPermitId = json['work_permit_id'],
        address = (json['address'] as Map<String,dynamic>?) != null ? Address.fromJson(json['address'] as Map<String,dynamic>) : null,
        role = (json['role'] as Map<String,dynamic>?) != null ? Role.fromJson(json['role'] as Map<String,dynamic>) : null,
        corporate = (json['corporate'] as Map<String,dynamic>?) != null ? Corporate.fromJson(json['corporate'] as Map<String,dynamic>) : null,
        images = (json['images'] as List?)?.map((dynamic e) => Images.fromJson(e as Map<String,dynamic>)).toList(),
        services = json['services'] as List?;

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
    'address' : address?.toJson(),
    'role' : role?.toJson(),
    'corporate' : corporate?.toJson(),
    'images' : images?.map((e) => e.toJson()).toList(),
    'services' : services
  };
}

class Address {
  final int? id;
  final String? address;
  final String? longitude;
  final String? latitude;

  Address({
    this.id,
    this.address,
    this.longitude,
    this.latitude,
  });

  Address.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        address = json['address'] as String?,
        longitude = json['longitude'] as String?,
        latitude = json['latitude'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'address' : address,
    'longitude' : longitude,
    'latitude' : latitude
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

class Corporate {
  final int? id;
  final String? name;
  final String? email;

  Corporate({
    this.id,
    this.name,
    this.email,
  });

  Corporate.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        email = json['email'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'email' : email
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