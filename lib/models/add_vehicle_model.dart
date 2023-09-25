class AddVehicleModel {
  String? status;
  Data? data;

  AddVehicleModel({this.status, this.data});

  AddVehicleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? vehicleTypeId;
  int? userId;
  String? model;
  String? color;
  int? boardNumber;
  String? vehicleImage;
  String? mechanicImage;
  String? boardImage;
  String? idImage;
  String? delegateImage;
  String? createdAt;
  String? updatedAt;
  Type? type;

  Data(
      {this.id,
      this.vehicleTypeId,
      this.userId,
      this.model,
      this.color,
      this.boardNumber,
      this.vehicleImage,
      this.mechanicImage,
      this.boardImage,
      this.idImage,
      this.delegateImage,
      this.createdAt,
      this.updatedAt,
      this.type});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vehicleTypeId = json['vehicle_type_id'];
    userId = json['user_id'];
    model = json['model'];
    color = json['color'];
    boardNumber = json['board_number'];
    vehicleImage = json['vehicle_image'];
    mechanicImage = json['mechanic_image'];
    boardImage = json['board_image'];
    idImage = json['id_image'];
    delegateImage = json['delegate_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vehicle_type_id'] = vehicleTypeId;
    data['user_id'] = userId;
    data['model'] = model;
    data['color'] = color;
    data['board_number'] = boardNumber;
    data['vehicle_image'] = vehicleImage;
    data['mechanic_image'] = mechanicImage;
    data['board_image'] = boardImage;
    data['id_image'] = idImage;
    data['delegate_image'] = delegateImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}

class Type {
  int? id;
  String? name;

  Type({this.id, this.name});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;

    return data;
  }
}
