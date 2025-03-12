class ServiceListModel {
  final bool? status;
  final String? message;
  final List<DataList>? data;

  ServiceListModel({this.status, this.message, this.data});

  ServiceListModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => DataList.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };
}

class DataList {
  final int? id;
  final String? name;
  final String? currency;
  final String? price;
  final int? userId;
  final int? corporateId;
  final String? createdAt;
  final String? updatedAt;

  DataList({
    this.id,
    this.name,
    this.currency,
    this.price,
    this.userId,
    this.corporateId,
    this.createdAt,
    this.updatedAt,
  });

  DataList.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        currency = json['currency'] as String?,
        price = json['price'] as String?,
        userId = json['user_id'] as int?,
        corporateId = json['corporate_id'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'currency': currency,
    'price': price,
    'user_id': userId,
    'corporate_id': corporateId,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}

